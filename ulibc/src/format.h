#pragma once

#include <stdarg.h>
#include <stddef.h>

int ulibc_write(const char *data, size_t size);

int ulibc_format_vprintf(const char *fmt, va_list ap);
int ulibc_format_vsnprintf(char *buf, size_t bufsize, const char *fmt, va_list ap);
