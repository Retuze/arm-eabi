/*
 * barelib.h — bare-metal C runtime subset
 *
 * Provides the minimum types, macros, and function declarations that
 * CherryUSB and the application code depend on without pulling in any
 * hosted-environment standard library.
 *
 * Only include freestanding-guaranteed headers (<stddef.h>, <stdint.h>,
 * <stdbool.h>) — these are defined by the C standard to be available in
 * a freestanding implementation and are provided directly by the compiler
 * (not by OS-level sysroots).
 */
#ifndef BARELIB_H
#define BARELIB_H

/* ── Guaranteed freestanding headers ────────────────────────────────────── */
#include <stdarg.h>  /* va_list, va_start, va_arg, va_end               */
#include <stdbool.h> /* bool, true, false                               */
#include <stddef.h>  /* NULL, size_t, ptrdiff_t, offsetof              */
#include <stdint.h>  /* uint8_t … uint64_t, uintptr_t, INT*_MAX, …    */

#include "print.h"


void *memset(void *s, int c, size_t n);
void *memcpy(void *dst, const void *src, size_t n);
void *memmove(void *dst, const void *src, size_t n);
int memcmp(const void *s1, const void *s2, size_t n);

#define stdin  0
#define stdout 1
#define stderr 2

#define read(fd, buf, count)  u_read(buf, count)
#define write(fd, buf, count) u_write(buf, count)

#define printf    u_printf
#define vprintf   u_vprintf
#define snprintf  u_snprintf
#define vsnprintf u_vsnprintf

#define strlen(s) u_strlen(s)
#define memrev(a, n) u_memrev(a, n)

int u_read(char *buf, size_t count);




#endif /* BARELIB_H */
