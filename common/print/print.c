#include "print.h"

#include "bsp_uart.h"

#include <stddef.h>
#include <stdint.h>

static void put_char(char ch)
{
    uart_write_byte((uint8_t)ch);
}

static void put_str(const char *s)
{
    if (s == NULL) {
        return;
    }
    while (*s != '\0') {
        put_char(*s++);
    }
}

static void put_uint_base(uint64_t value, unsigned int base, int uppercase)
{
    char buf[32];
    int idx = 0;

    if (value == 0U) {
        put_char('0');
        return;
    }

    while ((value > 0U) && (idx < (int)sizeof(buf))) {
        uint64_t digit = value % (uint64_t)base;
        if (digit < 10U) {
            buf[idx++] = (char)('0' + (char)digit);
        } else {
            buf[idx++] = (char)((uppercase ? 'A' : 'a') + (char)(digit - 10U));
        }
        value /= (uint64_t)base;
    }

    while (idx-- > 0) {
        put_char(buf[idx]);
    }
}

static void put_int64(int64_t x)
{
    uint64_t mag;
    if (x < 0) {
        put_char('-');
        mag = (uint64_t)(-(x + 1LL)) + 1ULL;
    } else {
        mag = (uint64_t)x;
    }
    put_uint_base(mag, 10U, 0);
}

static void put_fixed6(double x)
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
        if (frac_bits != 0U) {
            put_str("nan");
        } else if ((bits & 0x8000000000000000ULL) != 0ULL) {
            put_str("-inf");
        } else {
            put_str("inf");
        }
        return;
    }

    if ((bits & 0x8000000000000000ULL) != 0ULL) {
        put_char('-');
        x = -x;
    }

    if (x > 18446744073709551615.0) {
        put_str("ovf");
        return;
    }

    int_part = (uint64_t)x;
    frac_part = x - (double)int_part;

    frac_part += 0.0000005;
    if (frac_part >= 1.0) {
        frac_part -= 1.0;
        int_part++;
    }

    put_uint_base(int_part, 10U, 0);
    put_char('.');

    for (i = 0; i < 6; ++i) {
        uint32_t digit;
        frac_part *= 10.0;
        digit = (uint32_t)frac_part;
        if (digit > 9U) {
            digit = 9U;
        }
        put_char((char)('0' + digit));
        frac_part -= (double)digit;
    }
}

void print_int(int x)
{
    put_int64((int64_t)x);
}

void print_uint(unsigned int x)
{
    put_uint_base((uint64_t)x, 10U, 0);
}

void print_long(long x)
{
    put_int64((int64_t)x);
}

void print_ulong(unsigned long x)
{
    put_uint_base((uint64_t)x, 10U, 0);
}

void print_llong(long long x)
{
    put_int64((int64_t)x);
}

void print_ullong(unsigned long long x)
{
    put_uint_base((uint64_t)x, 10U, 0);
}

void print_float(float x)
{
    put_fixed6((double)x);
}

void print_double(double x)
{
    put_fixed6(x);
}

void print_ldouble(long double x)
{
    put_fixed6((double)x);
}

void print_bool(_Bool x)
{
    put_char(x ? '1' : '0');
}

void print_string(const char *s)
{
    put_str(s);
}

void print_ptr(const void *p)
{
    uintptr_t v = (uintptr_t)p;
    int shift;

    put_char('0');
    put_char('x');

    for (shift = (int)(sizeof(uintptr_t) * 8U) - 4; shift >= 0; shift -= 4) {
        uint8_t nibble = (uint8_t)((v >> shift) & 0xFU);
        put_char((char)((nibble < 10U) ? ('0' + nibble) : ('a' + (nibble - 10U))));
    }
}

void print_unknown(void)
{
    put_str("[?]");
}

int vprintf(const char *fmt, va_list ap)
{
    int written = 0;

    if (fmt == NULL) {
        return 0;
    }

    while (*fmt != '\0') {
        if (*fmt != '%') {
            put_char(*fmt++);
            written++;
            continue;
        }

        fmt++;
        if (*fmt == '%') {
            put_char('%');
            fmt++;
            written++;
            continue;
        }

        {
            int long_count = 0;
            int is_unsigned = 0;
            int uppercase = 0;

            while (*fmt == 'l') {
                long_count++;
                fmt++;
            }

            switch (*fmt) {
            case 'd':
            case 'i':
                if (long_count >= 2) {
                    print_llong(va_arg(ap, long long));
                } else if (long_count == 1) {
                    print_long(va_arg(ap, long));
                } else {
                    print_int(va_arg(ap, int));
                }
                break;
            case 'u':
                is_unsigned = 1;
                break;
            case 'x':
            case 'X':
                uppercase = (*fmt == 'X') ? 1 : 0;
                is_unsigned = 2;
                break;
            case 'p':
                print_ptr(va_arg(ap, void *));
                break;
            case 'c':
                put_char((char)va_arg(ap, int));
                break;
            case 's':
            {
                const char *s = va_arg(ap, const char *);
                if (s == NULL) {
                    s = "(null)";
                }
                put_str(s);
                break;
            }
            case 'f':
                print_double(va_arg(ap, double));
                break;
            default:
                put_char('%');
                if (*fmt != '\0') {
                    put_char(*fmt);
                } else {
                    fmt--;
                }
                break;
            }

            if (is_unsigned == 1) {
                if (long_count >= 2) {
                    print_ullong(va_arg(ap, unsigned long long));
                } else if (long_count == 1) {
                    print_ulong(va_arg(ap, unsigned long));
                } else {
                    print_uint(va_arg(ap, unsigned int));
                }
            } else if (is_unsigned == 2) {
                uint64_t value;
                if (long_count >= 2) {
                    value = (uint64_t)va_arg(ap, unsigned long long);
                } else if (long_count == 1) {
                    value = (uint64_t)va_arg(ap, unsigned long);
                } else {
                    value = (uint64_t)va_arg(ap, unsigned int);
                }
                put_uint_base(value, 16U, uppercase);
            }

            if (*fmt != '\0') {
                fmt++;
            }
        }
    }

    uart_wait_tc();
    return written;
}

int printf(const char *fmt, ...)
{
    int rc;
    va_list ap;

    va_start(ap, fmt);
    rc = vprintf(fmt, ap);
    va_end(ap);

    return rc;
}
