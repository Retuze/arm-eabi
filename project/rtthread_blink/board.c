#include <rthw.h>
#include <rtthread.h>

#include "bsp.h"

#define RT_HEAP_SIZE (32U * 1024U)

static rt_uint8_t rt_heap[RT_HEAP_SIZE];

void SysTick_Handler(void)
{
    rt_interrupt_enter();
    rt_tick_increase();
    rt_interrupt_leave();
}

void rt_hw_board_init(void)
{
    rcc_set_system_hz(240000000UL);

    rt_system_heap_init(rt_heap, rt_heap + sizeof(rt_heap));
}

void rt_hw_console_output(const char *str)
{
    if (str != RT_NULL) {
        rtt_write(str, (uint32_t)__builtin_strlen(str));
    }
}
