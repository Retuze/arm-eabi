#pragma once
#ifndef _SF32_UART_H_
#define _SF32_UART_H_

#include <stdint.h>

void uart_write_byte(uint8_t value);
void uart_wait_tc(void);

#define USART_CR1_UE             (1UL << 0)
#define USART_CR1_RE             (1UL << 2)
#define USART_CR1_TE             (1UL << 3)
#define USART_CR1_RXNEIE         (1UL << 5)
#define USART_CR1_TXEIE          (1UL << 7)
#define USART_CR1_PS             (1UL << 9)
#define USART_CR1_PCE            (1UL << 10)
#define USART_CR1_OVER8          (1UL << 14)
#define USART_CR1_M_Pos          27U
#define USART_CR1_M_Msk          (0x3UL << USART_CR1_M_Pos)
#define USART_CR2_STOP_Pos       12U
#define USART_CR2_STOP_Msk       (0x3UL << USART_CR2_STOP_Pos)
#define USART_CR3_ONEBIT         (1UL << 11)
#define USART_ISR_PE             (1UL << 0)
#define USART_ISR_FE             (1UL << 1)
#define USART_ISR_NF             (1UL << 2)
#define USART_ISR_ORE            (1UL << 3)
#define USART_ISR_IDLE           (1UL << 4)
#define USART_ISR_RXNE           (1UL << 5)
#define USART_ISR_TC             (1UL << 6)
#define USART_ISR_TXE            (1UL << 7)
#define USART_ICR_PECF           (1UL << 0)
#define USART_ICR_FECF           (1UL << 1)
#define USART_ICR_NCF            (1UL << 2)
#define USART_ICR_ORECF          (1UL << 3)
#define USART_ICR_IDLECF         (1UL << 4)

#endif
