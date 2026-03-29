#ifndef __LCD_DRIVER_H__
#define __LCD_DRIVER_H__

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/* LCD屏幕尺寸定义（根据实际屏幕修改） */
#define LCD_WIDTH   390
#define LCD_HEIGHT  450

/* LCD颜色定义（RGB565格式） */
#define LCD_COLOR_BLACK     0x0000
#define LCD_COLOR_WHITE     0xFFFF
#define LCD_COLOR_RED       0xF800
#define LCD_COLOR_GREEN     0x07E0
#define LCD_COLOR_BLUE      0x001F
#define LCD_COLOR_YELLOW    0xFFE0
#define LCD_COLOR_CYAN      0x07FF
#define LCD_COLOR_MAGENTA   0xF81F

/**
 * @brief 初始化LCD屏幕
 */
void lcd_init(void);

/**
 * @brief LCD硬件复位
 */
void lcd_reset(void);

/**
 * @brief 设置LCD显示窗口
 * @param x0 起始X坐标
 * @param y0 起始Y坐标
 * @param x1 结束X坐标
 * @param y1 结束Y坐标
 */
void lcd_set_window(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1);

/**
 * @brief 填充指定颜色
 * @param color RGB565颜色值
 */
void lcd_fill_color(uint16_t color);

/**
 * @brief 填充指定区域
 * @param x0 起始X坐标
 * @param y0 起始Y坐标
 * @param x1 结束X坐标
 * @param y1 结束Y坐标
 * @param color RGB565颜色值
 */
void lcd_fill_rect(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t color);

/**
 * @brief 绘制一个像素点
 * @param x X坐标
 * @param y Y坐标
 * @param color RGB565颜色值
 */
void lcd_draw_pixel(uint16_t x, uint16_t y, uint16_t color);

#ifdef __cplusplus
}
#endif

#endif /* __LCD_DRIVER_H__ */
