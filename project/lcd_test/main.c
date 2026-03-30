#include <stdint.h>

#include "board.h"
#include "gpio.h"
#include "lcd_driver.h"
#include "qspi.h"

/*
 * 通过调试器读取下面全局变量，可得到GPIO翻转速率估算值。
 */
volatile uint32_t g_io_toggle_count = 0;
volatile uint32_t g_io_toggle_duration_ms = 0;
volatile uint32_t g_io_toggle_hz = 0;

static uint32_t benchmark_io_toggle(uint32_t duration_ms)
{
    uint32_t start = millis();
    uint32_t end = start + duration_ms;
    uint32_t toggles = 0;

    while ((int32_t)(millis() - end) < 0) {
        digitalWrite(LCD_CLK, HIGH);
        digitalWrite(LCD_CLK, LOW);
        toggles += 2U;
    }

    g_io_toggle_count = toggles;
    g_io_toggle_duration_ms = duration_ms;
    g_io_toggle_hz = (duration_ms == 0U) ? 0U : ((toggles * 1000U) / duration_ms);

    return g_io_toggle_hz;
}

int main(void)
{
    pinMode(LED0, OUTPUT);

    lcd_init();

    /* 渲染全屏矩形（整屏纯色） */
    lcd_fill_rect(0, 0, LCD_WIDTH - 1, LCD_HEIGHT - 1, LCD_COLOR_BLUE);

    /* 软件模拟QSPI使用到的关键发送函数已放到RAM段，下面测试IO翻转速度。 */
    (void)benchmark_io_toggle(1000U);

    while (1) {
        digitalToggle(LED0);
        delay(200);
    }
}
