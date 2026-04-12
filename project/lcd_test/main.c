#include "SF32LB52.h"
#include "bsp_dwt.h"
#include "bsp_rcc.h"
#include "bsp_uart.h"
#include "lcd.h"

int main(void)
{
    const uint32_t target_hclk_hz = 240000000UL;
    uint16_t color = 0x0000U;
    int rc;

    println("lcd_test start");
    rc = sf32_rcc_set_hclk_hz(target_hclk_hz);
    print("set hclk rc=");
    println(rc);
    print("hclk(rcc)=");
    println((unsigned int)sf32_rcc_get_hclk_hz());

    rc = sf32_dwt_init();
    print("dwt_init rc=");
    println(rc);

    rc = lcd_init();
    print("lcd_init rc=");
    println(rc);

    while (1) {
        lcd_fill_rect(0U, 0U, LCD_WIDTH - 1U, LCD_HEIGHT - 1U, color);
        color = (color == 0x0000U) ? 0xFFFFU : 0x0000U;
        delay(500);
    }
}
