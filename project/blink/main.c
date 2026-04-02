#include "bsp_gpio.h"
#include "bsp_uart.h"
#include "SF32LB52.h"

int main(void)
{
    pinMode(31, OUTPUT);
    while (1) {
        digitalToggle(31);
        sf32_log("Hello, SF32LB52x!\n");
        delay(500);
    }
}
