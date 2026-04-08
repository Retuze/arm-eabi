#include "SF32LB52.h"
#include "board.h"
#include "bsp_gpio.h"
#include "bsp_rcc.h"
#include "bsp_uart.h"
#include "lcd.h"

static void lcd_show_color_bars(void)
{
    const uint16_t colors[] = {
        0xF800, /* red */
        0x07E0, /* green */
        0x001F, /* blue */
        0xFFE0, /* yellow */
        0xF81F, /* magenta */
        0x07FF, /* cyan */
        0xFFFF, /* white */
        0x0000, /* black */
    };
    const uint16_t band_height = LCD_HEIGHT / (uint16_t)(sizeof(colors) / sizeof(colors[0]));
    uint16_t i;

    for (i = 0U; i < (uint16_t)(sizeof(colors) / sizeof(colors[0])); ++i) {
        uint16_t y0 = (uint16_t)(i * band_height);
        uint16_t y1 = (i == ((uint16_t)(sizeof(colors) / sizeof(colors[0])) - 1U))
            ? (LCD_HEIGHT - 1U)
            : (uint16_t)(y0 + band_height - 1U);

        lcd_fill_rect(0U, y0, LCD_WIDTH - 1U, y1, colors[i]);
    }
}

int main(void)
{
    const uint32_t target_hclk_hz = 240000000UL;
    int rc;

    pinMode(LED_RED, OUTPUT);

    println("lcd_test start");
    rc = sf32_rcc_set_hclk_hz(target_hclk_hz);
    print("set hclk rc=");
    println(rc);

    rc = lcd_init();
    print("lcd_init rc=");
    println(rc);

    // lcd_show_color_bars();

    while (1) {
        digitalToggle(LED_RED);
        delay(500);
        // lcd_fill_color(0x0000);
        // delay(300);
        // lcd_show_color_bars();
    }
}
