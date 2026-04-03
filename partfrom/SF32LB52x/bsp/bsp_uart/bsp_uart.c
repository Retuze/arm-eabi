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
    (void)value;
    print_str("<float>");
}

void print_double(double value)
{
    (void)value;
    print_str("<double>");
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
