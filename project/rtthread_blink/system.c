#include <errno.h>
#include <stddef.h>
#include <stdint.h>
#include <sys/types.h>
#include <unistd.h>

#include <rtthread.h>

#include "bsp.h"

extern const uintptr_t g_pfnVectors[];
extern size_t _end;
extern size_t __StackLimit;

void SystemInit(void)
{
    SCB_VTOR = (uint32_t)(uintptr_t)g_pfnVectors;

    SCB_DEMCR |= SCB_DEMCR_TRCENA;
    DWT_CYCCNT = 0U;
    DWT_CTRL |= DWT_CTRL_CYCCNTENA;
}

uint32_t millis(void)
{
    return (uint32_t)rt_tick_get_millisecond();
}

void delay(uint32_t ms)
{
    rt_thread_mdelay(ms);
}

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
    for (size_t i = 0; i < count; i++) {
        uart_write_byte(p[i]);
    }
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
