/*
 * system.c — RT-Thread board-level init, picolibc retarget locks,
 *            per-thread TLS management, and POSIX syscall stubs.
 */

#include <stddef.h>
#include <stdint.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/lock.h>
#include <unistd.h>
#include <string.h>
#include <picotls.h>

#include <rtthread.h>
#include <rthw.h>
#include "bsp.h"

/* ======================================================================== */
/*  Linker symbols                                                          */
/* ======================================================================== */

extern const uintptr_t g_pfnVectors[];
extern char  _end[];
extern char  __StackLimit[];
extern char  __tls_base[];

/* ======================================================================== */
/*  RT-Thread board-level initialisation (called by rtthread_startup)       */
/* ======================================================================== */

static volatile uint32_t g_sf32_tick_ms;

void SysTick_Handler(void)
{
    rt_interrupt_enter();
    rt_tick_increase();
    ++g_sf32_tick_ms;
    rt_interrupt_leave();
}

void rt_hw_board_init(void)
{
    const uint32_t default_hclk_hz = 140000000UL;
    const uint32_t syst_csr_enable    = (1UL << 0);
    const uint32_t syst_csr_tickint   = (1UL << 1);
    const uint32_t syst_csr_clksource = (1UL << 2);

    SCB_VTOR = (uint32_t)(uintptr_t)g_pfnVectors;
    g_sf32_tick_ms = 0U;

    SCB_DEMCR |= SCB_DEMCR_TRCENA;
    DWT_CYCCNT = 0U;
    DWT_CTRL |= DWT_CTRL_CYCCNTENA;

    SYST_CSR = 0U;
    SYST_RVR = (default_hclk_hz / RT_TICK_PER_SECOND) - 1UL;
    SYST_CVR = 0U;
    SYST_CSR = syst_csr_clksource | syst_csr_tickint | syst_csr_enable;

    rt_system_heap_init(_end, __StackLimit);

    rt_scheduler_sethook(_picolibc_tls_switch_hook);
}

uint32_t millis(void)
{
    return g_sf32_tick_ms;
}

void delay(uint32_t ms)
{
    rt_thread_mdelay((rt_int32_t)ms);
}

/* rt_kprintf backend */
void rt_hw_console_output(const char *str)
{
    if (str) {
        rtt_write(str, (uint32_t)rt_strlen(str));
    }
}

/* ======================================================================== */
/*  Picolibc TLS — per-thread Thread Local Storage                         */
/* ======================================================================== */

/*
 * Scheduler hook: on every context switch, point the ARM TPIDRURW register
 * to the new thread's private TLS block so that __aeabi_read_tp (provided
 * by libc.a) returns the correct address.
 *
 * Each thread's TLS block is allocated at the *top* of its stack by
 * _picolibc_tls_thread_init() below.
 */
static void _picolibc_tls_switch_hook(struct rt_thread *from,
                                      struct rt_thread *to)
{
    (void)from;
    if (to && to->user_data) {
        _set_tls((void *)to->user_data);
    }
}

/*
 * Call this after rt_thread_create / rt_thread_init and before
 * rt_thread_startup to give the thread its own TLS block.
 * The block is allocated from the heap — it will leak if the thread
 * exits without explicit cleanup, but for typical embedded threads
 * that run forever this is fine.
 */
void picolibc_tls_thread_init(rt_thread_t tid)
{
    size_t sz  = _tls_size();
    size_t aln = _tls_align();
    void  *blk;

    if (sz == 0) {
        return;
    }

    blk = rt_malloc(sz + aln);
    if (!blk) {
        return;
    }

    uintptr_t addr = ((uintptr_t)blk + aln - 1) & ~(uintptr_t)(aln - 1);
    _init_tls((void *)addr);

    tid->user_data = (rt_ubase_t)addr;
}

/* ======================================================================== */
/*  Picolibc retarget locks — backed by RT-Thread mutexes                  */
/* ======================================================================== */

/*
 * picolibc declares:
 *   struct __lock;
 *   typedef struct __lock *_LOCK_T;
 *
 * We define struct __lock to hold an rt_mutex, so that each _LOCK_T
 * is simply a pointer to our struct containing the rt_mutex.
 */
struct __lock {
    struct rt_mutex mutex;
};

static struct __lock _libc_recursive_lock;

/* picolibc references this by name via __LOCK_INIT_RECURSIVE */
struct __lock __lock___libc_recursive_mutex;

static rt_bool_t _scheduler_started(void)
{
    return (rt_thread_self() != RT_NULL);
}

static void _lock_init_common(struct __lock *lock)
{
    rt_mutex_init(&lock->mutex, "libc", RT_IPC_FLAG_PRIO);
}

void __retarget_lock_init(_LOCK_T *lock)
{
    *lock = (struct __lock *)rt_malloc(sizeof(struct __lock));
    if (*lock) {
        _lock_init_common(*lock);
    }
}

void __retarget_lock_init_recursive(_LOCK_T *lock)
{
    __retarget_lock_init(lock);
}

void __retarget_lock_close(_LOCK_T lock)
{
    if (lock) {
        rt_mutex_detach(&lock->mutex);
        rt_free(lock);
    }
}

void __retarget_lock_close_recursive(_LOCK_T lock)
{
    __retarget_lock_close(lock);
}

void __retarget_lock_acquire(_LOCK_T lock)
{
    if (lock && _scheduler_started()) {
        rt_mutex_take(&lock->mutex, RT_WAITING_FOREVER);
    }
}

void __retarget_lock_acquire_recursive(_LOCK_T lock)
{
    __retarget_lock_acquire(lock);
}

void __retarget_lock_release(_LOCK_T lock)
{
    if (lock && _scheduler_started()) {
        rt_mutex_release(&lock->mutex);
    }
}

void __retarget_lock_release_recursive(_LOCK_T lock)
{
    __retarget_lock_release(lock);
}

/* static libc mutex: initialised early, never freed */
static int _libc_lock_inited;

static void _ensure_libc_lock(void)
{
    if (!_libc_lock_inited) {
        _lock_init_common(&__lock___libc_recursive_mutex);
        _libc_lock_inited = 1;
    }
}

__attribute__((constructor))
static void _libc_lock_ctor(void)
{
    _ensure_libc_lock();
}

/* ======================================================================== */
/*  POSIX syscall stubs for picolibc (stdin/stdout/stderr → RTT)           */
/* ======================================================================== */

ssize_t write(int fd, const void *buf, size_t count)
{
    const char *p = (const char *)buf;

    if (p == NULL || count == 0U) {
        return 0;
    }
    if (fd != STDOUT_FILENO && fd != STDERR_FILENO) {
        errno = EBADF;
        return -1;
    }
    rtt_write(p, (uint32_t)count);
    return (ssize_t)count;
}

ssize_t read(int fd, void *buf, size_t count)
{
    char *p = (char *)buf;

    if (p == NULL || count == 0U) {
        return 0;
    }
    if (fd != STDIN_FILENO) {
        errno = EBADF;
        return -1;
    }
    return (ssize_t)rtt_read(p, (uint32_t)count);
}

int close(int fd)
{
    (void)fd;
    return 0;
}

off_t lseek(int fd, off_t offset, int whence)
{
    (void)fd;
    (void)offset;
    (void)whence;
    return 0;
}

void *sbrk(ptrdiff_t incr)
{
    static char *heap_end;
    char *prev;

    if (heap_end == NULL) {
        heap_end = (char *)&_end;
    }
    prev = heap_end;
    if (incr < 0) {
        if ((size_t)(-incr) > (size_t)(heap_end - (char *)&_end)) {
            errno = EINVAL;
            return (void *)-1;
        }
        heap_end += incr;
        return (void *)prev;
    }
    if (incr == 0) {
        return (void *)prev;
    }
    if ((uintptr_t)(heap_end + incr) >= (uintptr_t)&__StackLimit) {
        errno = ENOMEM;
        return (void *)-1;
    }
    heap_end += incr;
    return (void *)prev;
}
