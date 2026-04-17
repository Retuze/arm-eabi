#include "bsp.h"

int main(void)
{
    pinMode(31, OUTPUT);
    while (1) {
        digitalToggle(31);
        delay(500);
    }
}
