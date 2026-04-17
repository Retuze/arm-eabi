/*
 * ulibc.c — micro libc memory operations
 *
 * Plain C, no compiler builtins relied upon (-fno-builtin compatible).
 * Word-aligned fast paths for memset/memcpy.
 */

#include "ulibc.h"

void *u_memset(void *s, int c, size_t n)
{
    unsigned char *p = (unsigned char *)s;
    unsigned char val = (unsigned char)c;

    while (n > 0U && ((uintptr_t)p & 3U))
    {
        *p++ = val;
        n--;
    }
    if (n >= 4U)
    {
        uint32_t w = (uint32_t)val;
        w |= w << 8;
        w |= w << 16;
        uint32_t *wp = (uint32_t *)p;
        size_t wn = n >> 2;
        while (wn--)
        {
            *wp++ = w;
        }
        p = (unsigned char *)wp;
        n &= 3U;
    }
    while (n--)
    {
        *p++ = val;
    }
    return s;
}

void *u_memcpy(void *dst, const void *src, size_t n)
{
    unsigned char *d = (unsigned char *)dst;
    const unsigned char *s = (const unsigned char *)src;

    if (n >= 4U && !((uintptr_t)d & 3U) && !((uintptr_t)s & 3U))
    {
        uint32_t *dw = (uint32_t *)d;
        const uint32_t *sw = (const uint32_t *)s;
        size_t wn = n >> 2;
        while (wn--)
        {
            *dw++ = *sw++;
        }
        d = (unsigned char *)dw;
        s = (const unsigned char *)sw;
        n &= 3U;
    }
    while (n--)
    {
        *d++ = *s++;
    }
    return dst;
}

void *u_memmove(void *dst, const void *src, size_t n)
{
    unsigned char *d = (unsigned char *)dst;
    const unsigned char *s = (const unsigned char *)src;

    if (d == s || n == 0U)
    {
        return dst;
    }
    if (d < s)
    {
        while (n--)
        {
            *d++ = *s++;
        }
    }
    else
    {
        d += n;
        s += n;
        while (n--)
        {
            *--d = *--s;
        }
    }
    return dst;
}

int u_memcmp(const void *s1, const void *s2, size_t n)
{
    const unsigned char *p1 = (const unsigned char *)s1;
    const unsigned char *p2 = (const unsigned char *)s2;
    while (n--)
    {
        if (*p1 != *p2)
        {
            return (int)*p1 - (int)*p2;
        }
        p1++;
        p2++;
    }
    return 0;
}
