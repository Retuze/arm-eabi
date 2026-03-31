#include <stdint.h>

#ifndef SF32_SYSTEM_CLOCK_HZ
#define SF32_SYSTEM_CLOCK_HZ 24000000UL
#endif

#define SCS_BASE            (0xE000E000UL)
#define SYSTICK_BASE        (SCS_BASE + 0x0010UL)
#define SYST_CSR            (*(volatile uint32_t *)(SYSTICK_BASE + 0x0UL))
#define SYST_RVR            (*(volatile uint32_t *)(SYSTICK_BASE + 0x4UL))
#define SYST_CVR            (*(volatile uint32_t *)(SYSTICK_BASE + 0x8UL))

#define SYST_CSR_ENABLE     (1UL << 0)
#define SYST_CSR_TICKINT    (1UL << 1)
#define SYST_CSR_CLKSOURCE  (1UL << 2)

volatile uint32_t g_sf32_tick_ms;

void SystemInit(void)
{
    g_sf32_tick_ms = 0;
    SYST_RVR = (SF32_SYSTEM_CLOCK_HZ / 1000UL) - 1UL;
    SYST_CVR = 0;
    SYST_CSR = SYST_CSR_CLKSOURCE | SYST_CSR_TICKINT | SYST_CSR_ENABLE;
}

void SysTick_Handler(void)
{
    ++g_sf32_tick_ms;
}

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
