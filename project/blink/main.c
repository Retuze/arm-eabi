#include "bsp_gpio.h"
#include "bsp_dwt.h"
#include "bsp_rcc.h"
#include "bsp_uart.h"
#include "SF32LB52.h"

static const char *sf32_clock_rc_text(int rc)
{
    switch (rc) {
    case SF32_RCC_OK:
        return "ok";
    case SF32_RCC_ERR_INVALID_TARGET:
        return "invalid target";
    case SF32_RCC_ERR_DLL1_LOCK_TIMEOUT:
        return "dll1 lock timeout";
    case SF32_RCC_ERR_SWITCH_VERIFY:
        return "switch verify failed";
    case SF32_RCC_ERR_DVFS:
        return "dvfs config failed";
    default:
        return "unknown";
    }
}

int main(void)
{
    const uint32_t target_hclk_hz = 240000000UL;
    int rc;
    pinMode(31, OUTPUT);

    println("blink start");
    rc = sf32_rcc_set_hclk_hz(target_hclk_hz);
    print("set 240MHz rc=");
    print(rc);
    print(", ");
    println(sf32_clock_rc_text(rc));

    print("u32=");
    print(target_hclk_hz);
    print(", i32=");
    print((int32_t)-12345);
    print(", char=");
    print((char)'A');
    print(", bool=");
    print((bool)true);
    print(", ptr=");
    print((void *)&rc);
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
