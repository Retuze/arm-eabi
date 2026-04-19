/*
 * ulibc — ISO-like stdio for RTT/UART sink (printf, fwrite, …).
 * Firmware must implement ulibc_write() / ulibc_read() (typically in system.c).
 */
#ifndef ULIBC_STDIO_H
#define ULIBC_STDIO_H

#include <stddef.h>
#include <stdarg.h>

#ifdef __cplusplus
extern "C" {
#endif

#ifndef EOF
#define EOF (-1)
#endif

typedef struct ulibc_FILE {
    unsigned char kind; /* 0 stdin 1 stdout 2 stderr 3 mem (unused) */
} FILE;

extern FILE ulibc_stdin_obj;
extern FILE ulibc_stdout_obj;
extern FILE ulibc_stderr_obj;

#define stdin  (&ulibc_stdin_obj)
#define stdout (&ulibc_stdout_obj)
#define stderr (&ulibc_stderr_obj)

int ulibc_write(const char *data, size_t size);
int ulibc_read(char *buf, size_t count);

int printf(const char *fmt, ...) __attribute__((format(printf, 1, 2)));
int vprintf(const char *fmt, va_list ap);
int fprintf(FILE *stream, const char *fmt, ...) __attribute__((format(printf, 2, 3)));
int vfprintf(FILE *stream, const char *fmt, va_list ap);

int snprintf(char *s, size_t n, const char *fmt, ...) __attribute__((format(printf, 3, 4)));
int vsnprintf(char *s, size_t n, const char *fmt, va_list ap);

int sprintf(char *s, const char *fmt, ...) __attribute__((format(printf, 2, 3)));

size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);
int    fflush(FILE *stream);
FILE * fopen(const char *pathname, const char *mode);
int    fclose(FILE *stream);
int    fputc(int c, FILE *stream);
int    fputs(const char *s, FILE *stream);
int    putc(int c, FILE *stream);
int    putchar(int c);

#ifdef __cplusplus
}
#endif

#endif /* ULIBC_STDIO_H */
