#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include "format.h"

FILE ulibc_stdin_obj  = {0};
FILE ulibc_stdout_obj = {1};
FILE ulibc_stderr_obj = {2};

static int stream_is_out(const FILE *f)
{
    return f == &ulibc_stdout_obj || f == &ulibc_stderr_obj;
}

int printf(const char *fmt, ...)
{
    va_list ap;
    int     r;
    va_start(ap, fmt);
    r = ulibc_format_vprintf(fmt, ap);
    va_end(ap);
    return r;
}

int vprintf(const char *fmt, va_list ap)
{
    return ulibc_format_vprintf(fmt, ap);
}

int fprintf(FILE *stream, const char *fmt, ...)
{
    va_list ap;
    int     r;
    (void)stream;
    va_start(ap, fmt);
    r = ulibc_format_vprintf(fmt, ap);
    va_end(ap);
    return r;
}

int vfprintf(FILE *stream, const char *fmt, va_list ap)
{
    (void)stream;
    return ulibc_format_vprintf(fmt, ap);
}

int snprintf(char *s, size_t n, const char *fmt, ...)
{
    va_list ap;
    int     r;
    va_start(ap, fmt);
    r = ulibc_format_vsnprintf(s, n, fmt, ap);
    va_end(ap);
    return r;
}

int vsnprintf(char *s, size_t n, const char *fmt, va_list ap)
{
    return ulibc_format_vsnprintf(s, n, fmt, ap);
}

int sprintf(char *s, const char *fmt, ...)
{
    va_list ap;
    int     r;
    enum { ULIBC_SPRINTF_MAX = 4096 };
    va_start(ap, fmt);
    r = ulibc_format_vsnprintf(s, (size_t)ULIBC_SPRINTF_MAX, fmt, ap);
    va_end(ap);
    return r;
}

size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream)
{
    size_t total;
    if (!ptr || size == 0U || nmemb == 0U) {
        return 0;
    }
    total = size * nmemb;
    if (!stream_is_out(stream) && stream != &ulibc_stdin_obj) {
        return 0;
    }
    if (ulibc_write((const char *)ptr, total) < 0) {
        return 0;
    }
    return nmemb;
}

int fflush(FILE *stream)
{
    (void)stream;
    return 0;
}

FILE *fopen(const char *pathname, const char *mode)
{
    (void)pathname;
    (void)mode;
    return NULL;
}

int fclose(FILE *stream)
{
    (void)stream;
    return 0;
}

int fputc(int c, FILE *stream)
{
    char ch = (char)c;
    if (!stream_is_out(stream)) {
        return EOF;
    }
    if (ulibc_write(&ch, 1U) != 1) {
        return EOF;
    }
    return (unsigned char)c;
}

int fputs(const char *s, FILE *stream)
{
    size_t n;
    if (!s || !stream_is_out(stream)) {
        return EOF;
    }
    n = strlen(s);
    if (ulibc_write(s, n) != (int)n) {
        return EOF;
    }
    return (int)n;
}

int putc(int c, FILE *stream)
{
    return fputc(c, stream);
}

int putchar(int c)
{
    return fputc(c, stdout);
}
