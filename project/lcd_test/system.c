#include "bsp.h"
#include "ulibc.h"

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
