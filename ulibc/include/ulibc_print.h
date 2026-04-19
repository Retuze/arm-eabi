/*
 * Extra helpers (not required by ISO C): type-dispatched print / println.
 * Prefer <stdio.h> for printf; include this header when you want print(x).
 */
#ifndef ULIBC_PRINT_H
#define ULIBC_PRINT_H

#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

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
        long long:          print_llong,                                                                 \
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

#endif /* ULIBC_PRINT_H */
