#include "bsp.h"
#include "print.h"

extern const uintptr_t g_pfnVectors[];

static volatile uint32_t g_sf32_tick_ms;

void SystemInit(void)
{
    const uint32_t default_hclk_hz = 140000000UL;
    const uint32_t syst_csr_enable = (1UL << 0);
    const uint32_t syst_csr_tickint = (1UL << 1);
    const uint32_t syst_csr_clksource = (1UL << 2);

    SCB_VTOR = (uint32_t)(uintptr_t)g_pfnVectors;
    g_sf32_tick_ms = 0U;

    SCB_DEMCR |= SCB_DEMCR_TRCENA;
    DWT_CYCCNT = 0U;
    DWT_CTRL |= DWT_CTRL_CYCCNTENA;

    SYST_CSR = 0U;
    SYST_RVR = (default_hclk_hz / 1000UL) - 1UL;
    SYST_CVR = 0U;
    SYST_CSR = syst_csr_clksource | syst_csr_tickint | syst_csr_enable;
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
    while ((uint32_t)(millis() - start) < ms) {
    }
}

int u_write(const char *data, size_t size)
{
    if (!data || size == 0U) {
        return 0;
    }
    rtt_write(data, (uint32_t)size);
    return (int)size;
}

int u_read(char *buf, size_t count)
{
    if (!buf || count == 0U) {
        return 0;
    }
    return (int)rtt_read(buf, (uint32_t)count);
}
