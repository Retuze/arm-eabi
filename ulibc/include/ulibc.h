/*
 * ulibc.h — micro libc for bare-metal targets
 *
 * Freestanding C runtime: printf, memory ops, type-based print macros.
 * Requires u_write() and u_read() to be provided by the application.
 */
#ifndef ULIBC_H
#define ULIBC_H

#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/* ── Memory operations ─────────────────────────────────────────────────── */

void *u_memset(void *s, int c, size_t n);
void *u_memcpy(void *dst, const void *src, size_t n);
void *u_memmove(void *dst, const void *src, size_t n);
int   u_memcmp(const void *s1, const void *s2, size_t n);

/* ── I/O stubs (provided by each project's system.c) ──────────────────── */

int    u_write(const char *data, size_t size);
int    u_read(char *buf, size_t count);

/* ── String utilities ──────────────────────────────────────────────────── */

size_t u_strlen(const char *s);
void   u_memrev(char *a, size_t n);

/* ── Formatted output ──────────────────────────────────────────────────── */

int u_printf(const char *fmt, ...);
int u_vprintf(const char *fmt, va_list ap);
int u_snprintf(char *buf, size_t bufsize, const char *fmt, ...);
int u_vsnprintf(char *buf, size_t bufsize, const char *fmt, va_list ap);

/* ── Type-based print (_Generic) ───────────────────────────────────────── */

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

/* ── libc-style name mappings ──────────────────────────────────────────── */

#define stdin  0
#define stdout 1
#define stderr 2

#define read(fd, buf, count)  u_read(buf, count)
#define write(fd, buf, count) u_write(buf, count)

#define printf    u_printf
#define vprintf   u_vprintf
#define snprintf  u_snprintf
#define vsnprintf u_vsnprintf

#define memset(s, c, n)       u_memset(s, c, n)
#define memcpy(dst, src, n)   u_memcpy(dst, src, n)
#define memmove(dst, src, n)  u_memmove(dst, src, n)
#define memcmp(s1, s2, n)     u_memcmp(s1, s2, n)
#define strlen(s)             u_strlen(s)
#define memrev(a, n)          u_memrev(a, n)

#ifdef __cplusplus
}
#endif

#endif /* ULIBC_H */
