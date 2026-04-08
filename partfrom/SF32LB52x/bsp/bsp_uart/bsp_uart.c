#include "bsp_uart.h"

#include "SF32LB52.h"

#include <stddef.h>
#include <stdint.h>

static inline void uart_write_byte(uint8_t value)
{
    while ((USART1->ISR & USART_ISR_TXE) == 0U) {
    }
    USART1->TDR = value;
}

static inline void uart_write_char(char ch)
{
    if (ch == '\n') {
        uart_write_byte((uint8_t)'\r');
    }
    uart_write_byte((uint8_t)ch);
}

static inline void uart_wait_tc(void)
{
    while ((USART1->ISR & USART_ISR_TC) == 0U) {
    }
}

void print_int(int x)
{
    uint32_t v;
    char buf[10];
    int idx = 0;

    if (x < 0) {
        uart_write_char('-');
        x = -x;
    }

    v = (uint32_t)x;
    if (v == 0U) {
        uart_write_char('0');
        uart_wait_tc();
        return;
    }

    while ((v > 0U) && (idx < (int)sizeof(buf))) {
        buf[idx++] = (char)('0' + (char)(v % 10U));
        v /= 10U;
    }

    while (idx-- > 0) {
        uart_write_char(buf[idx]);
    }

    uart_wait_tc();
}

void print_uint(unsigned int x)
{
    uint32_t v = (uint32_t)x;
    char buf[10];
    int idx = 0;

    if (v == 0U) {
        uart_write_char('0');
        uart_wait_tc();
        return;
    }

    while ((v > 0U) && (idx < (int)sizeof(buf))) {
        buf[idx++] = (char)('0' + (char)(v % 10U));
        v /= 10U;
    }

    while (idx-- > 0) {
        uart_write_char(buf[idx]);
    }

    uart_wait_tc();
}

void print_long(long x)
{
    print_int((int)x);
}

void print_ulong(unsigned long x)
{
    print_uint((unsigned int)x);
}

void print_llong(long long x)
{
    uint64_t v;
    int shift;

    if (x < 0) {
        uart_write_char('-');
        x = -x;
    }

    v = (uint64_t)x;
    uart_write_char('0');
    uart_write_char('x');

    for (shift = 60; shift >= 0; shift -= 4) {
        uint8_t nibble = (uint8_t)((v >> shift) & 0xFU);
        uart_write_char((char)((nibble < 10U) ? ('0' + nibble) : ('a' + (nibble - 10U))));
    }

    uart_wait_tc();
}

void print_ullong(unsigned long long x)
{
    uint64_t v = (uint64_t)x;
    int shift;

    uart_write_char('0');
    uart_write_char('x');

    for (shift = 60; shift >= 0; shift -= 4) {
        uint8_t nibble = (uint8_t)((v >> shift) & 0xFU);
        uart_write_char((char)((nibble < 10U) ? ('0' + nibble) : ('a' + (nibble - 10U))));
    }

    uart_wait_tc();
}

void print_float(float x)
{
    const float divisors[] = {
        1000000000.0f, 100000000.0f, 10000000.0f, 1000000.0f, 100000.0f,
        10000.0f, 1000.0f, 100.0f, 10.0f, 1.0f
    };
    uint32_t bits;
    uint32_t exp_bits;
    uint32_t frac_bits;
    int started = 0;
    size_t i;

    {
        union {
            float f;
            uint32_t u;
        } u = { x };
        bits = u.u;
    }

    exp_bits = (bits >> 23U) & 0xFFU;
    frac_bits = bits & 0x7FFFFFU;

    if (exp_bits == 0xFFU) {
        if (frac_bits != 0U) {
            print_string("nan");
        } else if ((bits & 0x80000000U) != 0U) {
            print_string("-inf");
        } else {
            print_string("inf");
        }
        return;
    }

    if ((bits & 0x80000000U) != 0U) {
        uart_write_char('-');
        x = -x;
    }

    for (i = 0; i < (sizeof(divisors) / sizeof(divisors[0])); ++i) {
        int digit = 0;
        float d = divisors[i];

        while (x >= d) {
            x -= d;
            digit++;
        }

        if ((digit != 0) || started || (d == 1.0f)) {
            uart_write_char((char)('0' + digit));
            started = 1;
        }
    }

    uart_write_char('.');
    for (i = 0; i < 6U; ++i) {
        int digit = 0;
        x *= 10.0f;
        while (x >= 1.0f) {
            x -= 1.0f;
            digit++;
        }
        uart_write_char((char)('0' + digit));
    }

    uart_wait_tc();
}

void print_double(double x)
{
    (void)x;
    print_string("<double>");
}

void print_ldouble(long double x)
{
    (void)x;
    print_string("<ldouble>");
}

void print_bool(_Bool x)
{
    if (x) {
        uart_write_char('1');
    } else {
        uart_write_char('0');
    }
    uart_wait_tc();
}

void print_string(const char *s)
{
    if (s == 0) {
        return;
    }

    while (*s != '\0') {
        uart_write_char(*s++);
    }

    uart_wait_tc();
}

void print_ptr(const void *p)
{
    uintptr_t v = (uintptr_t)p;
    int shift;

    uart_write_char('0');
    uart_write_char('x');

    for (shift = (int)(sizeof(uintptr_t) * 8U) - 4; shift >= 0; shift -= 4) {
        uint8_t nibble = (uint8_t)((v >> shift) & 0xFU);
        uart_write_char((char)((nibble < 10U) ? ('0' + nibble) : ('a' + (nibble - 10U))));
    }

    uart_wait_tc();
}

void print_unknown(void)
{
    print_string("[?]");
}
