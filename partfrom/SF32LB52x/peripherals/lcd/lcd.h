#pragma once
#ifndef _LCD_H_
#define _LCD_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define LCD_WIDTH  384U
#define LCD_HEIGHT 448U

void lcd_reset(void);
void lcd_read_id(uint8_t id[3]);
int lcd_init(void);

void lcd_set_window(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1);
void lcd_fill_color(uint16_t color);
void lcd_fill_rect(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t color);
void lcd_draw_pixel(uint16_t x, uint16_t y, uint16_t color);

#ifdef __cplusplus
}
#endif

#endif // _LCD_H_
