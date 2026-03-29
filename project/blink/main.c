#include "gpio.h"
#include "board.h"

int main(void)
{
    pinMode(LED0, OUTPUT);
    while (1) {
        digitalToggle(LED0);
        delay(1000);
    }
}
