#pragma once
#ifndef _BB_QSPI_H_
#define _BB_QSPI_H_

#include <stdint.h>

/**
 * @brief 初始化QSPI GPIO引脚
 * 配置LCD_CLK、LCD_CS、LCD_D0~D3为输出模式，并设置初始状态
 */
void qspi_gpio_init(void);

/**
 * @brief 命令开始，拉低CS引脚
 * @note 在发送命令和数据前调用此函数，表示命令开始
 */
void qspi_cmd_start(void);

/**
 * @brief 命令结束，拉高CS引脚
 * @note 在发送完命令和数据后调用此函数，表示命令结束
 */
void qspi_cmd_end(void);

/**
 * @brief 发送一个字节（单线模式，使用D0）
 * @param data 要发送的数据
 * @note 字节内位顺序：MSB优先（从bit7到bit0）
 */
void qspi_send_byte(uint8_t data);

/**
 * @brief 发送一个字节（4线模式，使用D0~D3）
 * @param data 要发送的数据
 * @note 字节内位顺序：MSB优先（从bit7到bit0）
 */
void qspi_send_byte_4wire(uint8_t data);

/**
 * @brief 发送数据（单线模式）
 * @param data 数据缓冲区
 * @param len 数据长度
 * @note 字节内：MSB优先；多字节数据：按数组顺序发送
 */
void qspi_send_data(const uint8_t *data, uint16_t len);

/**
 * @brief 发送数据（4线模式）
 * @param data 数据缓冲区
 * @param len 数据长度
 * @note 字节内：MSB优先；多字节数据：按数组顺序发送
 */
void qspi_send_data_4wire(const uint8_t *data, uint16_t len);

/**
 * @brief 读取一个字节（单线模式，使用D0）
 * @return 读取的数据字节
 */
uint8_t qspi_read_byte(void);

/**
 * @brief 读取数据（单线模式）
 * @param data 数据缓冲区
 * @param len 要读取的数据长度
 * @note 字节内：MSB优先；多字节数据：按数组顺序存储
 */
void qspi_read_data(uint8_t *data, uint16_t len);  


#endif // _BB_QSPI_H_