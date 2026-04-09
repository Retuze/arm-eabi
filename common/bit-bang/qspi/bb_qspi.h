#pragma once
#ifndef _BB_QSPI_H_
#define _BB_QSPI_H_

#include <stdint.h>

/* 初始化模拟 QSPI：CLK/CS/D0~D3 输出，空闲时 CLK=0、CS=1 */
void qspi_init(void);

/* 命令开始：CS 拉低 */
void qspi_cmd_start(void);

/* 命令结束：CS 拉高 */
void qspi_cmd_end(void);

/* 单线发送 1 字节，位序 MSB->LSB（bit7 到 bit0） */
void qspi_send_byte(uint8_t data);

/* 4 线发送 1 字节，先发高 4 位再发低 4 位 */
void qspi_send_byte_4wire(uint8_t data);

/* 单线发送 len 字节，按 buffer 顺序 */
void qspi_send_data(const uint8_t *data, uint16_t len);

/* 4 线发送 len 字节，按 buffer 顺序 */
void qspi_send_data_4wire(const uint8_t *data, uint16_t len);

/* 单线读取 1 字节，位序 MSB->LSB */
uint8_t qspi_read_byte(void);

/* 单线读取 len 字节，按 buffer 顺序存放 */
void qspi_read_data(uint8_t *data, uint16_t len);  


#endif // _BB_QSPI_H_
