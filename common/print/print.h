/*
 * Minimal printf for MCUs: no libc string/stdio in implementation.
 * You implement u_write(); the rest is small and stays on-stack buffers only.
 *
 * Supported: %% %c %s %d %i %u %x %X %p %f %F (double, full precision; no libm).
 * NaN text matches UCRT (-nan(ind) / -NAN(IND) when sign bit set).
 * Integers (d i u x X): flags - + space # 0, field width, .precision; * consumes
 * int from va_args (negative width acts as left align + positive width; negative
 * precision is treated as omitted). 0 flag ignored when precision
 * is given (C rules). %c %s: width and precision (UCRT-style; '0' pads %s width even with .prec).
 * %p: fixed-width uppercase hex (no 0x); width pads with spaces (UCRT ignores '0' for %p).
 * Length l ll z j t h hh: correct va_arg types for d i u x X; ignored for p/f; %lc reads wint_t.
 *
 * printf / snprintf names are mapped to u_* so shared code can use libc-style names.
 * Use this header only in translation units that link print.c (MCU firmware). On a pure
 * host TU that needs real libc stdio, do not include this header.
 */
#pragma once
#ifndef PRINT_H
#define PRINT_H

#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Block write sink. Return number of bytes written, or negative on error.
 * On MCU: map to UART/DMA/etc.
 */
int u_write(const char *data, size_t size);

int u_printf(const char *fmt, ...);
int u_vprintf(const char *fmt, va_list ap);

/** C99-style snprintf return: chars that would have been written (excl. \\0). */
int u_snprintf(char *buf, size_t bufsize, const char *fmt, ...);
int u_vsnprintf(char *buf, size_t bufsize, const char *fmt, va_list ap);


#define printf    u_printf
#define vprintf   u_vprintf
#define snprintf  u_snprintf
#define vsnprintf u_vsnprintf

/* -------- type-based printing (_Generic); all print_* go through u_write only -------- */

void print_int(int x);
void print_uint(unsigned int x);
void print_long(long x);
void print_ulong(unsigned long x);
void print_llong(long long x);
void print_ullong(unsigned long long x);
void print_float(float x);
void print_double(double x);
void print_bool(bool x);
void print_string(const char *s);
void print_ptr(const void *p);
void print_unknown(void);

/* `true`/`false` are int constants; use print((bool)true) or a _Bool variable for bool dispatch. */
#define print(x)                                                                                       \
    _Generic((x),                                                                                      \
        char:               print_int,                                                                 \
        signed char:        print_int,                                                                 \
        unsigned char:      print_uint,                                                                \
        int:                print_int,                                                                 \
        unsigned int:       print_uint,                                                                \
        long:               print_long,                                                                \
        unsigned long:      print_ulong,                                                               \
        long long:          print_llong,                                                               \
        unsigned long long: print_ullong,                                                              \
        float:              print_float,                                                               \
        double:             print_double,                                                              \
        bool:               print_bool,                                                                \
        char *:             print_string,                                                              \
        const char *:       print_string,                                                              \
        void *:             print_ptr,                                                                 \
        const void *:       print_ptr,                                                                 \
        default:            print_unknown)(x)

#define println(x)            \
    do {                        \
        print(x);               \
        print_string("\n");     \
    } while (0)

#ifdef __cplusplus
}
#endif

#endif /* PRINT_H */
