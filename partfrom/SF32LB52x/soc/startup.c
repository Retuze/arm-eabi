#include <stdint.h>
#include <stddef.h>

#include "SF32LB52.h"

/* Linker symbols */
extern size_t __StackTop;
extern size_t __StackLimit;
extern size_t __data_load__;
extern size_t __data_start__;
extern size_t __data_end__;
extern size_t __bss_start__;
extern size_t __bss_end__;

/* External runtime entry */
extern int main(void);

volatile uint32_t g_sf32_tick_ms;
extern const uintptr_t g_pfnVectors[];

static uint32_t sf32_get_sysclk_hz(void)
{
    const uint32_t sel_sys_pos = 0U;
    const uint32_t sel_sys_msk = (0x3UL << sel_sys_pos);
    uint32_t sel_sys = (HPSYS_RCC->CSR.R & sel_sys_msk) >> sel_sys_pos;

    switch (sel_sys) {
    case 3U: {
        uint32_t dll1cr = HPSYS_RCC->DLL1CR.R;
        uint32_t dll1_en = dll1cr & 1U;
        uint32_t stg;
        if (dll1_en == 0U) {
            return 0U;
        }
        stg = (dll1cr >> 2U) & 0xFU;
        return (stg + 1U) * 24000000UL;
    }
    case 1U:
    case 0U:
    default:
        return 48000000UL;
    }
}

uint32_t sf32_get_hclk_hz(void)
{
    const uint32_t hdiv_pos = 0U;
    const uint32_t hdiv_msk = (0xFFUL << hdiv_pos);
    uint32_t sysclk = sf32_get_sysclk_hz();
    uint32_t hdiv = (HPSYS_RCC->CFGR.R & hdiv_msk) >> hdiv_pos;

    if (sysclk == 0U) {
        return 0U;
    }
    if (hdiv == 0U) {
        hdiv = 1U;
    }
    return sysclk / hdiv;
}

void SystemInit(void)
{
    const uint32_t syst_csr_enable = (1UL << 0);
    const uint32_t syst_csr_tickint = (1UL << 1);
    const uint32_t syst_csr_clksource = (1UL << 2);
    uint32_t hclk = sf32_get_hclk_hz();

    SCB_VTOR = (uint32_t)(uintptr_t)g_pfnVectors;
    g_sf32_tick_ms = 0;
    if (hclk == 0U) {
        hclk = 48000000UL;
    }
    SYST_RVR = (hclk / 1000UL) - 1UL;
    SYST_CVR = 0;
    SYST_CSR = syst_csr_clksource | syst_csr_tickint | syst_csr_enable;
}

static void Default_Handler(void)
{
    while (1) {
    }
}

void Reset_Handler(void)
{
    size_t *src = &__data_load__;
    size_t *dst = &__data_start__;

    __asm volatile ("msr msplim, %0" :: "r" (__StackLimit) : "memory");

    while (dst < &__data_end__) {
        *dst++ = *src++;
    }

    /* Zero-initialize .bss */
    dst = &__bss_start__;
    while (dst < &__bss_end__) {
        *dst++ = 0;
    }

    SystemInit();
    main();

    while (1) {
    }
}

static void SysTick_Handler(void)
{
    ++g_sf32_tick_ms;
}

void NMI_Handler(void) __attribute__((weak, alias("Default_Handler")));
void HardFault_Handler(void) __attribute__((weak, alias("Default_Handler")));
void MemManage_Handler(void) __attribute__((weak, alias("Default_Handler")));
void BusFault_Handler(void) __attribute__((weak, alias("Default_Handler")));
void UsageFault_Handler(void) __attribute__((weak, alias("Default_Handler")));
void SVC_Handler(void) __attribute__((weak, alias("Default_Handler")));
void DebugMon_Handler(void) __attribute__((weak, alias("Default_Handler")));
void PendSV_Handler(void) __attribute__((weak, alias("Default_Handler")));

/* Vector table */
__attribute__((section(".isr_vector"), used))
const uintptr_t g_pfnVectors[] = {
    (uintptr_t)&__StackTop,
    (uintptr_t)Reset_Handler,
    (uintptr_t)NMI_Handler,
    (uintptr_t)HardFault_Handler,
    (uintptr_t)MemManage_Handler,
    (uintptr_t)BusFault_Handler,
    (uintptr_t)UsageFault_Handler,
    0U, /* Reserved */
    0U, /* Reserved */
    0U, /* Reserved */
    0U, /* Reserved */
    (uintptr_t)SVC_Handler,
    (uintptr_t)DebugMon_Handler,
    0U, /* Reserved */
    (uintptr_t)PendSV_Handler,
    (uintptr_t)SysTick_Handler,
};

uint32_t millis(void)
{
    return g_sf32_tick_ms;
}

void delay(uint32_t ms)
{
    uint32_t start = millis();

    while ((millis() - start) < ms) {
    }
}
