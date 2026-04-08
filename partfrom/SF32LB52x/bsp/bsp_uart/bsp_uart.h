#pragma once
#ifndef _BSP_UART_H_
#define _BSP_UART_H_

/* USART1 direct log output, board default: 1Mbps */
#include <stdbool.h>
#include <stdint.h>

void print_int(int x);
void print_uint(unsigned int x);
void print_long(long x);
void print_ulong(unsigned long x);
void print_llong(long long x);
void print_ullong(unsigned long long x);
void print_float(float x);
void print_double(double x);
void print_ldouble(long double x);
void print_bool(_Bool x);
void print_string(const char *s);
void print_ptr(const void *p);
void print_unknown(void);

#define print(x) _Generic((x),                                             \
    char:               print_int,                                         \
    signed char:        print_int,                                         \
    unsigned char:      print_uint,                                        \
    int:                print_int,                                         \
    unsigned int:       print_uint,                                        \
    long:               print_long,                                        \
    unsigned long:      print_ulong,                                       \
    long long:          print_llong,                                       \
    unsigned long long: print_ullong,                                      \
    float:              print_float,                                       \
    double:             print_double,                                      \
    long double:        print_ldouble,                                     \
    _Bool:              print_bool,                                        \
    char *:             print_string,                                      \
    const char *:       print_string,                                      \
    void *:             print_ptr,                                         \
    const void *:       print_ptr,                                         \
    default:            print_unknown                                      \
)(x)

#define println(x) do { print(x); print_string("\n"); } while (0)

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
