#include <stdint.h>
#include "bsp.h"
#include <stdio.h>

int main(void)
{
    rcc_set_system_hz(240000000UL);

    pinMode(LED_RED, OUTPUT);

    printf("Hello, World!\n");
    while (1) {
        digitalWrite(LED_RED, HIGH);
        delay(500);
        digitalWrite(LED_RED, LOW);
        delay(500);
    }
}
