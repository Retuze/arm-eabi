#include <stdint.h>

extern uint32_t __StackTop;
extern uint32_t __StackLimit;
extern uint32_t __data_load__;
extern uint32_t __data_start__;
extern uint32_t __data_end__;
extern uint32_t __bss_start__;
extern uint32_t __bss_end__;

extern int main(void);
extern void SystemInit(void);

static void Default_Handler(void)
{
    while (1) {
    }
}

static inline void sf32_set_msplim(uint32_t value)
{
    __asm volatile ("msr msplim, %0" :: "r" (value) : "memory");
}

void Reset_Handler(void);
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

void Reset_Handler(void)
{
    uint32_t *src = &__data_load__;
    uint32_t *dst = &__data_start__;

    sf32_set_msplim((uint32_t)(uintptr_t)&__StackLimit);

    while (dst < &__data_end__) {
        *dst++ = *src++;
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
