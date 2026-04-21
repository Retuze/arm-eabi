#include <stdint.h>

#include "bsp.h"

void SystemInit(void)
{
    rcc_init();
    dwt_init();
}

uint32_t millis(void)
{
    return uwTick;
}

void delay(uint32_t ms)
{
    uint32_t tick = millis();
    while ((uint32_t)(millis() - tick) < ms) {
    }
}
