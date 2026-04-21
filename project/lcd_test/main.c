#include "bsp.h"
#include "lcd.h"

/* Simple gradient strip; lcd_draw_pixels sends ARGB8888 (driver may convert, e.g. TFT RGB565). */
enum { STRIP_W = 48U };

int main(void)
{
    static uint32_t strip[STRIP_W];
    uint32_t         i;

    pinMode(LED_RED, OUTPUT);

    for (i = 0U; i < STRIP_W; i++) {
        uint8_t g = (uint8_t)((i * 255U) / (STRIP_W - 1U));
        strip[i] = 0xFF000000u | ((uint32_t)g << 8);
    }

    lcd_init(&lcd0);
    lcd_draw_pixels(&lcd0, 8U, 8U, STRIP_W, 1U, strip);

    while (1) {
        digitalToggle(LED_RED);
        delay(500);
    }
}
