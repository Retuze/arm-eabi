#pragma once

#include <stdint.h>

#include "SF32LB52.h"

static inline void __set_MSP(uint32_t top_of_main_stack)
{
    __asm volatile ("msr msp, %0" :: "r" (top_of_main_stack) : "memory");
}

static inline void __DSB(void)
{
    __asm volatile ("dsb 0xF" ::: "memory");
}

static inline void __ISB(void)
{
    __asm volatile ("isb 0xF" ::: "memory");
}
