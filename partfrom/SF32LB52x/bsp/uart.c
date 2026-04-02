#include "uart.h"

#include "rcc.h"

#ifndef SF32_UART_CLOCK_HZ
#define SF32_UART_CLOCK_HZ 48000000UL
#endif

static void sf32_uart_enable_clock(USART_TypeDef *uart)
{
    if (uart == USART3) {
        sf32_rcc_enable_module(SF32_RCC_MOD_USART3);
    }
}

void sf32_uart_init(USART_TypeDef *uart, const sf32_uart_init_t *init)
{
    uint32_t cr1 = 0U;
    uint32_t cr2 = 0U;
    uint32_t cr3 = 0U;
    uint32_t word_length = 0U;
    uint32_t stop_bits = 0U;
    uint32_t div;

    if ((uart == 0) || (init == 0) || (init->baudrate == 0U)) {
        return;
    }

    sf32_uart_enable_clock(uart);

    switch (init->data_bits) {
    case 9:
        word_length = 3U;
        break;
    case 7:
        word_length = 1U;
        break;
    case 8:
    default:
        word_length = 2U;
        break;
    }

    if (init->stop_bits == SF32_UART_STOPBITS_2) {
        stop_bits = 2U;
    }

    if (init->parity == SF32_UART_PARITY_EVEN) {
        cr1 |= USART_CR1_PCE;
    } else if (init->parity == SF32_UART_PARITY_ODD) {
        cr1 |= USART_CR1_PCE | USART_CR1_PS;
    }

    div = SF32_UART_CLOCK_HZ / init->baudrate;
    if (div == 0U) {
        div = 1U;
    }

    cr1 |= (word_length << USART_CR1_M_Pos) & USART_CR1_M_Msk;
    cr1 |= USART_CR1_RE | USART_CR1_TE;
    cr2 |= (stop_bits << USART_CR2_STOP_Pos) & USART_CR2_STOP_Msk;
    cr3 |= USART_CR3_ONEBIT;

    uart->CR1 = 0U;
    uart->CR2 = cr2;
    uart->CR3 = cr3;
    uart->BRR = div;
    uart->ICR = USART_ICR_PECF | USART_ICR_FECF | USART_ICR_NCF |
                USART_ICR_ORECF | USART_ICR_IDLECF;
    uart->CR1 = cr1 | USART_CR1_UE;
}

void sf32_uart_write_byte(USART_TypeDef *uart, uint8_t value)
{
    while ((uart->ISR & USART_ISR_TXE) == 0U) {
    }

    uart->TDR = value;

    while ((uart->ISR & USART_ISR_TC) == 0U) {
    }
}

void sf32_uart_write(USART_TypeDef *uart, const void *data, uint32_t size)
{
    const uint8_t *bytes = (const uint8_t *)data;

    for (uint32_t i = 0; i < size; ++i) {
        sf32_uart_write_byte(uart, bytes[i]);
    }
}

int sf32_uart_read_byte(USART_TypeDef *uart, uint8_t *value)
{
    if ((uart == 0) || (value == 0)) {
        return -1;
    }

    if ((uart->ISR & (USART_ISR_PE | USART_ISR_FE | USART_ISR_NF | USART_ISR_ORE)) !=
        0U) {
        uart->ICR = USART_ICR_PECF | USART_ICR_FECF | USART_ICR_NCF |
                    USART_ICR_ORECF;
        return -1;
    }

    if ((uart->ISR & USART_ISR_RXNE) == 0U) {
        return 0;
    }

    *value = (uint8_t)(uart->RDR & 0xFFU);
    return 1;
}
