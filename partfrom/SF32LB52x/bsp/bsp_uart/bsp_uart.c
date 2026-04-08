#include "bsp_uart.h"

#include "SF32LB52.h"

#include <stddef.h>
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

void print_int(int x)
{
    uint32_t v;
    char buf[10];
    int idx = 0;

    if (x < 0) {
        uart_write_byte((uint8_t)'-');
        v = (uint32_t)(-(x + 1)) + 1U;
    } else {
        v = (uint32_t)x;
    }

    if (v == 0U) {
        uart_write_byte((uint8_t)'0');
    } else {
        while ((v > 0U) && (idx < (int)sizeof(buf))) {
            buf[idx++] = (char)('0' + (char)(v % 10U));
            v /= 10U;
        }
        while (idx-- > 0) {
            uart_write_byte((uint8_t)buf[idx]);
        }
    }
}

void print_uint(unsigned int x)
{
    uint32_t v = (uint32_t)x;
    char buf[10];
    int idx = 0;

    if (v == 0U) {
        uart_write_byte((uint8_t)'0');
    } else {
        while ((v > 0U) && (idx < (int)sizeof(buf))) {
            buf[idx++] = (char)('0' + (char)(v % 10U));
            v /= 10U;
        }
        while (idx-- > 0) {
            uart_write_byte((uint8_t)buf[idx]);
        }
    }
}

void print_long(long x)
{
    uint64_t v;
    char buf[20];
    int idx = 0;

    if (x < 0L) {
        uart_write_byte((uint8_t)'-');
        v = (uint64_t)(-(x + 1L)) + 1ULL;
    } else {
        v = (uint64_t)x;
    }

    if (v == 0U) {
        uart_write_byte((uint8_t)'0');
    } else {
        while ((v > 0U) && (idx < (int)sizeof(buf))) {
            buf[idx++] = (char)('0' + (char)(v % 10U));
            v /= 10U;
        }
        while (idx-- > 0) {
            uart_write_byte((uint8_t)buf[idx]);
        }
    }
}

void print_ulong(unsigned long x)
{
    uint64_t v = (uint64_t)x;
    char buf[20];
    int idx = 0;

    if (v == 0U) {
        uart_write_byte((uint8_t)'0');
    } else {
        while ((v > 0U) && (idx < (int)sizeof(buf))) {
            buf[idx++] = (char)('0' + (char)(v % 10U));
            v /= 10U;
        }
        while (idx-- > 0) {
            uart_write_byte((uint8_t)buf[idx]);
        }
    }
}

void print_llong(long long x)
{
    uint64_t v;
    char buf[20];
    int idx = 0;

    if (x < 0LL) {
        uart_write_byte((uint8_t)'-');
        v = (uint64_t)(-(x + 1LL)) + 1ULL;
    } else {
        v = (uint64_t)x;
    }

    if (v == 0U) {
        uart_write_byte((uint8_t)'0');
    } else {
        while ((v > 0U) && (idx < (int)sizeof(buf))) {
            buf[idx++] = (char)('0' + (char)(v % 10U));
            v /= 10U;
        }
        while (idx-- > 0) {
            uart_write_byte((uint8_t)buf[idx]);
        }
    }
}

void print_ullong(unsigned long long x)
{
    uint64_t v = (uint64_t)x;
    char buf[20];
    int idx = 0;

    if (v == 0U) {
        uart_write_byte((uint8_t)'0');
    } else {
        while ((v > 0U) && (idx < (int)sizeof(buf))) {
            buf[idx++] = (char)('0' + (char)(v % 10U));
            v /= 10U;
        }
        while (idx-- > 0) {
            uart_write_byte((uint8_t)buf[idx]);
        }
    }
}

void print_float(float x)
{
    double d = (double)x;
    uint64_t bits;
    uint64_t exp_bits;
    uint64_t frac_bits;
    uint64_t int_part;
    double frac_part;
    int i;

    {
        union {
            double f;
            uint64_t u;
        } u = { d };
        bits = u.u;
    }

    exp_bits = (bits >> 52U) & 0x7FFU;
    frac_bits = bits & 0xFFFFFFFFFFFFFULL;

    if (exp_bits == 0x7FFU) {
        const char *t;
        if (frac_bits != 0U) {
            t = "nan";
        } else if ((bits & 0x8000000000000000ULL) != 0ULL) {
            t = "-inf";
        } else {
            t = "inf";
        }
        while (*t != '\0') {
            uart_write_byte((uint8_t)*t++);
        }
        return;
    }

    if ((bits & 0x8000000000000000ULL) != 0ULL) {
        uart_write_byte((uint8_t)'-');
        d = -d;
    }

    if (d > 18446744073709551615.0) {
        const char *t = "ovf";
        while (*t != '\0') {
            uart_write_byte((uint8_t)*t++);
        }
        return;
    }

    int_part = (uint64_t)d;
    frac_part = d - (double)int_part;
    frac_part += 0.0000005;
    if (frac_part >= 1.0) {
        frac_part -= 1.0;
        int_part++;
    }

    {
        uint64_t v = int_part;
        char buf[20];
        int idx = 0;

        if (v == 0U) {
            uart_write_byte((uint8_t)'0');
        } else {
            while ((v > 0U) && (idx < (int)sizeof(buf))) {
                buf[idx++] = (char)('0' + (char)(v % 10U));
                v /= 10U;
            }
            while (idx-- > 0) {
                uart_write_byte((uint8_t)buf[idx]);
            }
        }
    }

    uart_write_byte((uint8_t)'.');
    for (i = 0; i < 6; ++i) {
        uint32_t digit;
        frac_part *= 10.0;
        digit = (uint32_t)frac_part;
        if (digit > 9U) {
            digit = 9U;
        }
        uart_write_byte((uint8_t)('0' + digit));
        frac_part -= (double)digit;
    }
}

void print_double(double x)
{
    uint64_t bits;
    uint64_t exp_bits;
    uint64_t frac_bits;
    uint64_t int_part;
    double frac_part;
    int i;

    {
        union {
            double f;
            uint64_t u;
        } u = { x };
        bits = u.u;
    }

    exp_bits = (bits >> 52U) & 0x7FFU;
    frac_bits = bits & 0xFFFFFFFFFFFFFULL;

    if (exp_bits == 0x7FFU) {
        const char *t;
        if (frac_bits != 0U) {
            t = "nan";
        } else if ((bits & 0x8000000000000000ULL) != 0ULL) {
            t = "-inf";
        } else {
            t = "inf";
        }
        while (*t != '\0') {
            uart_write_byte((uint8_t)*t++);
        }
        return;
    }

    if ((bits & 0x8000000000000000ULL) != 0ULL) {
        uart_write_byte((uint8_t)'-');
        x = -x;
    }

    if (x > 18446744073709551615.0) {
        const char *t = "ovf";
        while (*t != '\0') {
            uart_write_byte((uint8_t)*t++);
        }
        return;
    }

    int_part = (uint64_t)x;
    frac_part = x - (double)int_part;
    frac_part += 0.0000005;
    if (frac_part >= 1.0) {
        frac_part -= 1.0;
        int_part++;
    }

    {
        uint64_t v = int_part;
        char buf[20];
        int idx = 0;

        if (v == 0U) {
            uart_write_byte((uint8_t)'0');
        } else {
            while ((v > 0U) && (idx < (int)sizeof(buf))) {
                buf[idx++] = (char)('0' + (char)(v % 10U));
                v /= 10U;
            }
            while (idx-- > 0) {
                uart_write_byte((uint8_t)buf[idx]);
            }
        }
    }

    uart_write_byte((uint8_t)'.');
    for (i = 0; i < 6; ++i) {
        uint32_t digit;
        frac_part *= 10.0;
        digit = (uint32_t)frac_part;
        if (digit > 9U) {
            digit = 9U;
        }
        uart_write_byte((uint8_t)('0' + digit));
        frac_part -= (double)digit;
    }
}

void print_ldouble(long double x)
{
    double d = (double)x;
    uint64_t bits;
    uint64_t exp_bits;
    uint64_t frac_bits;
    uint64_t int_part;
    double frac_part;
    int i;

    {
        union {
            double f;
            uint64_t u;
        } u = { d };
        bits = u.u;
    }

    exp_bits = (bits >> 52U) & 0x7FFU;
    frac_bits = bits & 0xFFFFFFFFFFFFFULL;

    if (exp_bits == 0x7FFU) {
        const char *t;
        if (frac_bits != 0U) {
            t = "nan";
        } else if ((bits & 0x8000000000000000ULL) != 0ULL) {
            t = "-inf";
        } else {
            t = "inf";
        }
        while (*t != '\0') {
            uart_write_byte((uint8_t)*t++);
        }
        return;
    }

    if ((bits & 0x8000000000000000ULL) != 0ULL) {
        uart_write_byte((uint8_t)'-');
        d = -d;
    }

    if (d > 18446744073709551615.0) {
        const char *t = "ovf";
        while (*t != '\0') {
            uart_write_byte((uint8_t)*t++);
        }
        return;
    }

    int_part = (uint64_t)d;
    frac_part = d - (double)int_part;
    frac_part += 0.0000005;
    if (frac_part >= 1.0) {
        frac_part -= 1.0;
        int_part++;
    }

    {
        uint64_t v = int_part;
        char buf[20];
        int idx = 0;

        if (v == 0U) {
            uart_write_byte((uint8_t)'0');
        } else {
            while ((v > 0U) && (idx < (int)sizeof(buf))) {
                buf[idx++] = (char)('0' + (char)(v % 10U));
                v /= 10U;
            }
            while (idx-- > 0) {
                uart_write_byte((uint8_t)buf[idx]);
            }
        }
    }

    uart_write_byte((uint8_t)'.');
    for (i = 0; i < 6; ++i) {
        uint32_t digit;
        frac_part *= 10.0;
        digit = (uint32_t)frac_part;
        if (digit > 9U) {
            digit = 9U;
        }
        uart_write_byte((uint8_t)('0' + digit));
        frac_part -= (double)digit;
    }
}

void print_bool(_Bool x)
{
    if (x) {
        uart_write_byte((uint8_t)'1');
    } else {
        uart_write_byte((uint8_t)'0');
    }
}

void print_string(const char *s)
{
    if (s == NULL) {
        return;
    }

    while (*s != '\0') {
        if (*s == '\n') {
            uart_write_byte((uint8_t)'\r');
        }
        uart_write_byte((uint8_t)*s++);
    }
}

void print_ptr(const void *p)
{
    uintptr_t v = (uintptr_t)p;
    int shift;

    uart_write_byte((uint8_t)'0');
    uart_write_byte((uint8_t)'x');

    for (shift = (int)(sizeof(uintptr_t) * 8U) - 4; shift >= 0; shift -= 4) {
        uint8_t nibble = (uint8_t)((v >> shift) & 0xFU);
        uart_write_byte((uint8_t)((nibble < 10U) ? ('0' + nibble) : ('a' + (nibble - 10U))));
    }
}

void print_unknown(void)
{
    const char *s = "[?]";
    while (*s != '\0') {
        uart_write_byte((uint8_t)*s++);
    }
}
