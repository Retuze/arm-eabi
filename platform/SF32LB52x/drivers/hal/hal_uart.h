#pragma once
#ifndef _SF32_UART_H_
#define _SF32_UART_H_

#include <stdint.h>

void uart_write_byte(uint8_t value);
void uart_wait_tc(void);

#endif
