#pragma once

#include <stdint.h>

#include "SF32LB52.h"

#ifdef __cplusplus
extern "C" {
#endif

#define SF32_UART_PARITY_NONE 0U
#define SF32_UART_PARITY_EVEN 1U
#define SF32_UART_PARITY_ODD  2U

#define SF32_UART_STOPBITS_1  1U
#define SF32_UART_STOPBITS_2  2U

typedef struct {
    uint32_t baudrate;
    uint8_t data_bits;
    uint8_t stop_bits;
    uint8_t parity;
} sf32_uart_init_t;

void sf32_uart_init(USART_TypeDef *uart, const sf32_uart_init_t *init);
void sf32_uart_write_byte(USART_TypeDef *uart, uint8_t value);
void sf32_uart_write(USART_TypeDef *uart, const void *data, uint32_t size);
int sf32_uart_read_byte(USART_TypeDef *uart, uint8_t *value);

#ifdef __cplusplus
}
#endif
