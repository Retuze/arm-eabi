#pragma once
#ifndef _QSPI_H_
#define _QSPI_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief 初始化GPIO模拟QSPI接口
 * @note 使用的管脚定义在board.h中
 *       必需的管脚: LCD_CLK, LCD_D0, LCD_D1, LCD_D2, LCD_D3, LCD_CS, LCD_RST, LCD_BL
 */
void qspi_gpio_init(void);

/**
 * @brief 设置CS引脚电平
 * @param level 电平值 (HIGH=不选中/空闲, LOW=选中)
 */
void qspi_gpio_cs(uint8_t level);

/**
 * @brief 命令开始，拉低CS引脚
 * @note 在发送命令和数据前调用此函数，表示命令开始
 */
void qspi_gpio_cmd_start(void);

/**
 * @brief 命令结束，拉高CS引脚
 * @note 在发送完命令和数据后调用此函数，表示命令结束
 */
void qspi_gpio_cmd_end(void);

/**
 * @brief 发送一个字节（单线模式，使用D0）
 * @param data 要发送的数据
 * @note 字节内位顺序：MSB优先（从bit7到bit0）
 */
void qspi_gpio_send_byte(uint8_t data);

/**
 * @brief 发送一个字节（4线模式，使用D0-D3）
 * @param data 要发送的数据（完整8位，分两次发送：先高4位，后低4位）
 * @note 字节内位顺序：MSB优先（先发送bit7-4，再发送bit3-0）
 */
void qspi_gpio_send_byte_4wire(uint8_t data);

/**
 * @brief 发送数据（单线模式）
 * @param data 数据缓冲区
 * @param len 数据长度
 */
void qspi_gpio_send_data(const uint8_t *data, uint16_t len);

/**
 * @brief 发送数据（4线模式）
 * @param data 数据缓冲区
 * @param len 数据长度
 */
void qspi_gpio_send_data_4wire(const uint8_t *data, uint16_t len);

/**
 * @brief 复位LCD
 * @param rst_pin LCD复位引脚
 */
void lcd_hw_reset(uint8_t rst_pin);

#ifdef __cplusplus
}
#endif

#endif // _QSPI_H_
