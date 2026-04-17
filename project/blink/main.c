#include "bsp.h"
#include "print.h"

int main(void)
{
    const uint32_t target_hclk_hz = 240000000UL;
    pinMode(31, OUTPUT);

    println("blink start");
    rcc_set_system_hz(target_hclk_hz);
    print("set 240MHz hz=");
    println((unsigned int)rcc_get_system_hz());

    print("u32=");
    print(target_hclk_hz);
    print(", i32=");
    print((int32_t)-12345);
    print(", char=");
    print((char)'A');
    print(", bool=");
    print((bool)true);
    print(", ptr=");
    print((void *)&target_hclk_hz);
    print(", float=");
    print(3.14159f);
    print(", double=");
    print(2.718281828);
    println("");

    while (1) {
        digitalToggle(31);
        delay(500);
    }
}
