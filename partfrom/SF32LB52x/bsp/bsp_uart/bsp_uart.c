#include "bsp_uart.h"
#include "SF32LB52.h"

static inline void bsp_uart1_write_byte(uint8_t value)
{
    while ((USART1->ISR & USART_ISR_TXE) == 0U) {
    }

    USART1->TDR = value;
}

void print(const char *text)
{
    if (text == 0) {
        return;
    }

    while (*text != '\0') {
        char ch = *text++;
        if (ch == '\n') {
            bsp_uart1_write_byte((uint8_t)'\r');
        }
        bsp_uart1_write_byte((uint8_t)ch);
    }

    while ((USART1->ISR & USART_ISR_TC) == 0U) {
    }
}
