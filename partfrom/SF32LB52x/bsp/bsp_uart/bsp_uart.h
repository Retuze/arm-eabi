#pragma once
#ifndef _BSP_UART_H_
#define _BSP_UART_H_

/* USART1 direct log output, board default: 1Mbps */
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

void print_str(const char *text);
void print_char(char value);
void print_i32(int32_t value);
void print_u32(uint32_t value);
void print_i64(int64_t value);
void print_u64(uint64_t value);
void print_float(float value);
void print_double(double value);
void print_ptr(const void *value);
void print_bool(bool value);

#define print(value) \
    _Generic((value), \
        char: print_char, \
        signed char: print_i32, \
        unsigned char: print_u32, \
        short: print_i32, \
        unsigned short: print_u32, \
        int: print_i32, \
        unsigned int: print_u32, \
        long: print_i64, \
        unsigned long: print_u64, \
        long long: print_i64, \
        unsigned long long: print_u64, \
        float: print_float, \
        double: print_double, \
        long double: print_double, \
        char *: print_str, \
        const char *: print_str, \
        void *: print_ptr, \
        const void *: print_ptr, \
        bool: print_bool \
    )(value)

#define println(value) \
    do { \
        print(value); \
        print_char('\n'); \
    } while (0)

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

#endif // _BSP_UART_H_
