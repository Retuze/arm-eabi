#include <stddef.h>
#include <stdint.h>

#include "bsp.h"

extern size_t __StackTop;
extern size_t __StackLimit;
extern size_t __data_load__;
extern size_t __data_start__;
extern size_t __data_end__;
extern size_t __ramfunc_load__ __attribute__((weak));
extern size_t __ramfunc_start__ __attribute__((weak));
extern size_t __ramfunc_end__ __attribute__((weak));
extern size_t __bss_start__;
extern size_t __bss_end__;

extern int main(void);

static void Default_Handler(void)
{
    while (1) {
    }
}

void Reset_Handler(void)
{
    size_t *src = &__data_load__;
    size_t *dst = &__data_start__;

    __asm volatile("msr msplim, %0" : : "r"(__StackLimit) : "memory");

    while (dst < &__data_end__) {
        *dst++ = *src++;
    }

    if (&__ramfunc_start__ != 0 && &__ramfunc_end__ != 0 && &__ramfunc_load__ != 0) {
        src = &__ramfunc_load__;
        dst = &__ramfunc_start__;
        while (dst < &__ramfunc_end__) {
            *dst++ = *src++;
        }
    }

    dst = &__bss_start__;
    while (dst < &__bss_end__) {
        *dst++ = 0;
    }

    SystemInit();
    main();

    while (1) {
    }
}

void NMI_Handler(void) __attribute__((weak, alias("Default_Handler")));
void HardFault_Handler(void) __attribute__((weak, alias("Default_Handler")));
void MemManage_Handler(void) __attribute__((weak, alias("Default_Handler")));
void BusFault_Handler(void) __attribute__((weak, alias("Default_Handler")));
void UsageFault_Handler(void) __attribute__((weak, alias("Default_Handler")));
void SVC_Handler(void) __attribute__((weak, alias("Default_Handler")));
void DebugMon_Handler(void) __attribute__((weak, alias("Default_Handler")));
void PendSV_Handler(void) __attribute__((weak, alias("Default_Handler")));
void SysTick_Handler(void) __attribute__((weak, alias("Default_Handler")));

__attribute__((section(".isr_vector"), used))
const uintptr_t g_pfnVectors[] = {
    (uintptr_t)&__StackTop,
    (uintptr_t)Reset_Handler,
    (uintptr_t)NMI_Handler,
    (uintptr_t)HardFault_Handler,
    (uintptr_t)MemManage_Handler,
    (uintptr_t)BusFault_Handler,
    (uintptr_t)UsageFault_Handler,
    0U,
    0U,
    0U,
    0U,
    (uintptr_t)SVC_Handler,
    (uintptr_t)DebugMon_Handler,
    0U,
    (uintptr_t)PendSV_Handler,
    (uintptr_t)SysTick_Handler,
};
