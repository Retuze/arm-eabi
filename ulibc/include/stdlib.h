/*
 * ulibc — ISO C subset for freestanding firmware (malloc, abort, …).
 * Include with <stdlib.h>; implementation is linked via libulibc.
 */
#ifndef ULIBC_STDLIB_H
#define ULIBC_STDLIB_H

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

void *malloc(size_t size);
void  free(void *ptr);
void *calloc(size_t nmemb, size_t size);
void *realloc(void *ptr, size_t size);

void abort(void) __attribute__((noreturn));
void exit(int status) __attribute__((noreturn));

long               strtol(const char *nptr, char **endptr, int base);
long long          strtoll(const char *nptr, char **endptr, int base);
unsigned long      strtoul(const char *nptr, char **endptr, int base);
unsigned long long strtoull(const char *nptr, char **endptr, int base);
double             strtod(const char *nptr, char **endptr);
float              strtof(const char *nptr, char **endptr);

#ifdef __cplusplus
}
#endif

#endif /* ULIBC_STDLIB_H */
