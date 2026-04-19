#include <stddef.h>
#include <stdint.h>
#include <string.h>

void *memset(void *s, int c, size_t n)
{
    unsigned char *p = (unsigned char *)s;
    unsigned char  val = (unsigned char)c;

    while (n > 0U && ((uintptr_t)p & 3U)) {
        *p++ = val;
        n--;
    }
    if (n >= 4U) {
        uint32_t w = (uint32_t)val;
        w |= w << 8;
        w |= w << 16;
        uint32_t *wp = (uint32_t *)p;
        size_t    wn = n >> 2;
        while (wn--) {
            *wp++ = w;
        }
        p = (unsigned char *)wp;
        n &= 3U;
    }
    while (n--) {
        *p++ = val;
    }
    return s;
}

void *memcpy(void *dst, const void *src, size_t n)
{
    unsigned char *       d = (unsigned char *)dst;
    const unsigned char *s = (const unsigned char *)src;

    if (n >= 4U && !((uintptr_t)d & 3U) && !((uintptr_t)s & 3U)) {
        uint32_t *             dw = (uint32_t *)d;
        const uint32_t *       sw = (const uint32_t *)s;
        size_t                 wn = n >> 2;
        while (wn--) {
            *dw++ = *sw++;
        }
        d = (unsigned char *)dw;
        s = (const unsigned char *)sw;
        n &= 3U;
    }
    while (n--) {
        *d++ = *s++;
    }
    return dst;
}

void *memmove(void *dst, const void *src, size_t n)
{
    unsigned char *       d = (unsigned char *)dst;
    const unsigned char *s = (const unsigned char *)src;

    if (d == s || n == 0U) {
        return dst;
    }
    if (d < s) {
        while (n--) {
            *d++ = *s++;
        }
    } else {
        d += n;
        s += n;
        while (n--) {
            *--d = *--s;
        }
    }
    return dst;
}

int memcmp(const void *s1, const void *s2, size_t n)
{
    const unsigned char *p1 = (const unsigned char *)s1;
    const unsigned char *p2 = (const unsigned char *)s2;
    while (n--) {
        if (*p1 != *p2) {
            return (int)*p1 - (int)*p2;
        }
        p1++;
        p2++;
    }
    return 0;
}

size_t strlen(const char *s)
{
    size_t n = 0;
    while (s && s[n]) {
        ++n;
    }
    return n;
}

size_t strnlen(const char *s, size_t maxlen)
{
    size_t i = 0;
    if (!s) {
        return 0;
    }
    while (i < maxlen && s[i]) {
        ++i;
    }
    return i;
}

int strcmp(const char *s1, const char *s2)
{
    if (!s1 || !s2) {
        return (s1 == s2) ? 0 : (s1 ? 1 : -1);
    }
    while (*s1 && (*s1 == *s2)) {
        ++s1;
        ++s2;
    }
    return (unsigned char)*s1 - (unsigned char)*s2;
}

int strncmp(const char *s1, const char *s2, size_t n)
{
    if (n == 0U) {
        return 0;
    }
    if (!s1 || !s2) {
        return (s1 == s2) ? 0 : (s1 ? 1 : -1);
    }
    while (n > 0U && *s1 && (*s1 == *s2)) {
        ++s1;
        ++s2;
        --n;
    }
    if (n == 0U) {
        return 0;
    }
    return (unsigned char)*s1 - (unsigned char)*s2;
}

char *strcpy(char *dest, const char *src)
{
    char *d = dest;
    if (!dest || !src) {
        return dest;
    }
    while ((*d++ = *src++) != '\0') {
    }
    return dest;
}

char *strncpy(char *dest, const char *src, size_t n)
{
    size_t i;
    if (!dest || n == 0U) {
        return dest;
    }
    if (!src) {
        dest[0] = '\0';
        return dest;
    }
    for (i = 0; i < n && src[i]; ++i) {
        dest[i] = src[i];
    }
    for (; i < n; ++i) {
        dest[i] = '\0';
    }
    return dest;
}
