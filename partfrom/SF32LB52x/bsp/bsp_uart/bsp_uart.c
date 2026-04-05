#include "bsp_uart.h"
#include "SF32LB52.h"

static inline void bsp_uart1_write_byte(uint8_t value)
{
    while ((USART1->ISR & USART_ISR_TXE) == 0U) {
    }

    USART1->TDR = value;
}

static inline void bsp_uart1_write_char(char ch)
{
    if (ch == '\n') {
        bsp_uart1_write_byte((uint8_t)'\r');
    }
    bsp_uart1_write_byte((uint8_t)ch);
}

static inline void bsp_uart1_wait_tc(void)
{
    while ((USART1->ISR & USART_ISR_TC) == 0U) {
    }
}

static void print_uint64_hex(uint64_t value)
{
    int shift = (int)(sizeof(uint64_t) * 8U);

    bsp_uart1_write_char('0');
    bsp_uart1_write_char('x');

    for (shift -= 4; shift >= 0; shift -= 4) {
        uint8_t nibble = (uint8_t)((value >> shift) & 0xFU);
        char ch = (nibble < 10U) ? (char)('0' + nibble) : (char)('a' + (nibble - 10U));
        bsp_uart1_write_char(ch);
    }
}

static void print_float_digits_u32(uint32_t value)
{
    char buf[10];
    int idx = 0;

    if (value == 0U) {
        bsp_uart1_write_char('0');
        return;
    }

    while ((value > 0U) && (idx < (int)sizeof(buf))) {
        uint32_t digit = value % 10U;
        buf[idx++] = (char)('0' + (char)digit);
        value /= 10U;
    }

    while (idx-- > 0) {
        bsp_uart1_write_char(buf[idx]);
    }
}

static void print_float_fixed6(float value)
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
        } u = { value };
        bits = u.u;
    }

    exp_bits = (bits >> 23U) & 0xFFU;
    frac_bits = bits & 0x7FFFFFU;

    if (exp_bits == 0xFFU) {
        if (frac_bits != 0U) {
            print_str("nan");
        } else if ((bits & 0x80000000U) != 0U) {
            print_str("-inf");
        } else {
            print_str("inf");
        }
        return;
    }

    if ((bits & 0x80000000U) != 0U) {
        bsp_uart1_write_char('-');
        value = -value;
    }

    if (value >= 10000000000.0f) {
        int exp10 = 0;
        while ((value >= 10.0f) && (exp10 < 99)) {
            value /= 10.0f;
            exp10++;
        }

        {
            int digit = 0;
            while (value >= 1.0f) {
                value -= 1.0f;
                digit++;
            }
            bsp_uart1_write_char((char)('0' + digit));
        }

        bsp_uart1_write_char('.');
        for (i = 0; i < 6U; ++i) {
            int digit = 0;
            value *= 10.0f;
            while (value >= 1.0f) {
                value -= 1.0f;
                digit++;
            }
            bsp_uart1_write_char((char)('0' + digit));
        }

        bsp_uart1_write_char('e');
        if (exp10 >= 0) {
            bsp_uart1_write_char('+');
        } else {
            bsp_uart1_write_char('-');
            exp10 = -exp10;
        }
        print_float_digits_u32((uint32_t)exp10);
        return;
    }

    for (i = 0; i < (sizeof(divisors) / sizeof(divisors[0])); ++i) {
        int digit = 0;
        float d = divisors[i];

        while (value >= d) {
            value -= d;
            digit++;
        }

        if ((digit != 0) || started || (d == 1.0f)) {
            bsp_uart1_write_char((char)('0' + digit));
            started = 1;
        }
    }

    bsp_uart1_write_char('.');
    for (i = 0; i < 6U; ++i) {
        int digit = 0;
        value *= 10.0f;
        while (value >= 1.0f) {
            value -= 1.0f;
            digit++;
        }
        bsp_uart1_write_char((char)('0' + digit));
    }
}

void print_str(const char *text)
{
    if (text == 0) {
        return;
    }

    while (*text != '\0') {
        bsp_uart1_write_char(*text++);
    }

    bsp_uart1_wait_tc();
}

void print_char(char value)
{
    bsp_uart1_write_char(value);
    bsp_uart1_wait_tc();
}

void print_i32(int32_t value)
{
    if (value < 0) {
        bsp_uart1_write_char('-');
        value = -value;
    }

    print_u32((uint32_t)value);
    bsp_uart1_wait_tc();
}

void print_u32(uint32_t value)
{
    char buf[10];
    int idx = 0;

    if (value == 0U) {
        bsp_uart1_write_char('0');
        bsp_uart1_wait_tc();
        return;
    }

    while ((value > 0U) && (idx < (int)sizeof(buf))) {
        uint32_t digit = value % 10U;
        buf[idx++] = (char)('0' + (char)digit);
        value /= 10U;
    }

    while (idx-- > 0) {
        bsp_uart1_write_char(buf[idx]);
    }
    bsp_uart1_wait_tc();
}

void print_i64(int64_t value)
{
    if (value < 0) {
        bsp_uart1_write_char('-');
        value = -value;
    }

    print_uint64_hex((uint64_t)value);
    bsp_uart1_wait_tc();
}

void print_u64(uint64_t value)
{
    print_uint64_hex(value);
    bsp_uart1_wait_tc();
}

void print_float(float value)
{
    print_float_fixed6(value);
    bsp_uart1_wait_tc();
}

void print_double(double value)
{
    (void)value;
    print_str("<double>");
    bsp_uart1_wait_tc();
}

void print_ptr(const void *value)
{
    uintptr_t addr = (uintptr_t)value;
    int shift = (int)(sizeof(uintptr_t) * 8U);

    bsp_uart1_write_char('0');
    bsp_uart1_write_char('x');

    for (shift -= 4; shift >= 0; shift -= 4) {
        uint8_t nibble = (uint8_t)((addr >> shift) & 0xFU);
        char ch = (nibble < 10U) ? (char)('0' + nibble) : (char)('a' + (nibble - 10U));
        bsp_uart1_write_char(ch);
    }

    bsp_uart1_wait_tc();
}

void print_bool(bool value)
{
    if (value) {
        print_str("true");
    } else {
        print_str("false");
    }
}
