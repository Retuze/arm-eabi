#include <stddef.h>
#include <stdint.h>
#include <errno.h>
#include <sys/types.h>
#include <unistd.h>

#include "bsp.h"

extern const uintptr_t g_pfnVectors[];
extern size_t _end;
extern size_t __StackLimit;

static volatile uint32_t g_tick_ms;

void SysTick_Handler(void)
{
    ++g_tick_ms;
}

void SystemInit(void)
{
    SCB_VTOR = (uint32_t)(uintptr_t)g_pfnVectors;

    const uint32_t default_hclk_hz = 48000000UL;

    SCB_DEMCR |= SCB_DEMCR_TRCENA;
    DWT_CYCCNT = 0U;
    DWT_CTRL |= DWT_CTRL_CYCCNTENA;

    SYST_CSR = 0U;
    SYST_RVR = (default_hclk_hz / 1000U) - 1U;
    SYST_CVR = 0U;
    SYST_CSR = (1UL << 2) | (1UL << 1) | (1UL << 0);
}

uint32_t millis(void)
{
    return g_tick_ms;
}

void delay(uint32_t ms)
{
    uint32_t start = g_tick_ms;
    while ((g_tick_ms - start) < ms) {
        __asm volatile("wfi");
    }
}

void rt_hw_console_output(const char *str)
{
    if (str) {
        rtt_write(str, (uint32_t)__builtin_strlen(str));
    }
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
