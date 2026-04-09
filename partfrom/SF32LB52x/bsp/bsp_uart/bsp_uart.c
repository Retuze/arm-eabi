#include "bsp_uart.h"

#include "SF32LB52.h"

#include <stdint.h>

void uart_write_byte(uint8_t value)
{
    while ((USART1->ISR & USART_ISR_TXE) == 0U) {
    }
    USART1->TDR = value;
}

void uart_wait_tc(void)
{
    while ((USART1->ISR & USART_ISR_TC) == 0U) {
    }
}
