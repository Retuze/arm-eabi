#include "gpio.h"

#include <stdint.h>

extern volatile uint32_t g_sf32_tick_ms;

#define SCS_BASE            (0xE000E000UL)
#define SYSTICK_BASE        (SCS_BASE + 0x0010UL)
#define SYST_CSR            (*(volatile uint32_t *)(SYSTICK_BASE + 0x0UL))
#define SYST_RVR            (*(volatile uint32_t *)(SYSTICK_BASE + 0x4UL))
#define SYST_CVR            (*(volatile uint32_t *)(SYSTICK_BASE + 0x8UL))

int entry(void)
{
    SYST_CSR = 0;
    SYST_RVR = 0x2327FUL;
    SYST_CVR = 0;
    SYST_CSR = 0x7U;

    pinMode(31, OUTPUT);

    while (1) {
        uint32_t start;

        digitalToggle(31);
        start = g_sf32_tick_ms;
        while ((g_sf32_tick_ms - start) < 500U) {
        }
    }
}

int main(void)
{
    return entry();
}
