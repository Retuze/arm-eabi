#include <errno.h>
#include <limits.h>
#include <stdlib.h>

static const char *skip_ws(const char *s)
{
    while (*s == ' ' || *s == '\t' || *s == '\n' || *s == '\r' || *s == '\f' || *s == '\v') {
        ++s;
    }
    return s;
}

static int digit_value(unsigned char c, int base)
{
    if (c >= '0' && c <= '9') {
        return (int)c - '0';
    }
    if (base <= 10) {
        return -1;
    }
    if (c >= 'a' && c <= 'z') {
        return 10 + (int)c - 'a';
    }
    if (c >= 'A' && c <= 'Z') {
        return 10 + (int)c - 'A';
    }
    return -1;
}

static int ulibc_isdigit(unsigned char c)
{
    return c >= '0' && c <= '9';
}

static double pow10_int(int e)
{
    double x = 1.0;
    int    i;
    if (e >= 0) {
        for (i = 0; i < e && i < 308; ++i) {
            x *= 10.0;
        }
    } else {
        for (i = 0; i < -e && i < 308; ++i) {
            x /= 10.0;
        }
    }
    return x;
}

unsigned long strtoul(const char *nptr, char **endptr, int base)
{
    const char *       s = skip_ws(nptr);
    const char * const orig = s;
    int                neg = 0;
    unsigned long long acc = 0ULL;
    int                d;
    int                any = 0;

    if (*s == '+') {
        ++s;
    } else if (*s == '-') {
        neg = 1;
        ++s;
    }

    if (base == 0) {
        if (*s == '0' && (s[1] == 'x' || s[1] == 'X')) {
            base = 16;
            s += 2;
        } else {
            base = 10;
        }
    }
    if (base == 16 && *s == '0' && (s[1] == 'x' || s[1] == 'X')) {
        s += 2;
    }

    while ((d = digit_value((unsigned char)*s, base)) >= 0) {
        any = 1;
        if (acc > (ULLONG_MAX - (unsigned long long)d) / (unsigned long long)base) {
            errno = ERANGE;
            acc   = ULLONG_MAX;
            while (digit_value((unsigned char)*++s, base) >= 0) {
            }
            break;
        }
        acc = acc * (unsigned long long)base + (unsigned long long)d;
        ++s;
    }

    if (endptr) {
        *endptr = (char *)(any ? s : orig);
    }

    if (!any) {
        return 0UL;
    }

    if (neg) {
        unsigned long long mod = (unsigned long long)ULONG_MAX + 1ULL;
        return (unsigned long)((mod - (acc % mod)) % mod);
    }
    if (acc > (unsigned long long)ULONG_MAX) {
        errno = ERANGE;
        return ULONG_MAX;
    }
    return (unsigned long)acc;
}

unsigned long long strtoull(const char *nptr, char **endptr, int base)
{
    const char *       s = skip_ws(nptr);
    const char * const orig = s;
    int                neg = 0;
    unsigned long long acc = 0ULL;
    int                d;
    int                any = 0;

    if (*s == '+') {
        ++s;
    } else if (*s == '-') {
        neg = 1;
        ++s;
    }

    if (base == 0) {
        if (*s == '0' && (s[1] == 'x' || s[1] == 'X')) {
            base = 16;
            s += 2;
        } else {
            base = 10;
        }
    }
    if (base == 16 && *s == '0' && (s[1] == 'x' || s[1] == 'X')) {
        s += 2;
    }

    while ((d = digit_value((unsigned char)*s, base)) >= 0) {
        any = 1;
        if (acc > (ULLONG_MAX - (unsigned long long)d) / (unsigned long long)base) {
            errno = ERANGE;
            acc   = ULLONG_MAX;
            while (digit_value((unsigned char)*++s, base) >= 0) {
            }
            break;
        }
        acc = acc * (unsigned long long)base + (unsigned long long)d;
        ++s;
    }

    if (endptr) {
        *endptr = (char *)(any ? s : orig);
    }

    if (!any) {
        return 0ULL;
    }

    if (neg) {
        return ULLONG_MAX - acc + 1ULL;
    }
    return acc;
}

long strtol(const char *nptr, char **endptr, int base)
{
    const char *s = skip_ws(nptr);
    char *       ep = NULL;
    int          neg = 0;

    if (*s == '+') {
        ++s;
    } else if (*s == '-') {
        neg = 1;
        ++s;
    }

    {
        unsigned long u = strtoul(s, &ep, base);
        if (ep == s) {
            if (endptr) {
                *endptr = (char *)nptr;
            }
            return 0L;
        }
        if (endptr) {
            *endptr = ep;
        }
        if (!neg) {
            if (u > (unsigned long)LONG_MAX) {
                errno = ERANGE;
                return LONG_MAX;
            }
            return (long)u;
        }
        if (u > (unsigned long)LONG_MAX + 1UL) {
            errno = ERANGE;
            return LONG_MIN;
        }
        return (long)(0UL - u);
    }
}

long long strtoll(const char *nptr, char **endptr, int base)
{
    const char *s = skip_ws(nptr);
    char *       ep = NULL;
    int          neg = 0;

    if (*s == '+') {
        ++s;
    } else if (*s == '-') {
        neg = 1;
        ++s;
    }

    {
        unsigned long long u = strtoull(s, &ep, base);
        if (ep == s) {
            if (endptr) {
                *endptr = (char *)nptr;
            }
            return 0LL;
        }
        if (endptr) {
            *endptr = ep;
        }
        if (!neg) {
            if (u > (unsigned long long)LLONG_MAX) {
                errno = ERANGE;
                return LLONG_MAX;
            }
            return (long long)u;
        }
        if (u > (unsigned long long)LLONG_MAX + 1ULL) {
            errno = ERANGE;
            return LLONG_MIN;
        }
        return (long long)(0ULL - u);
    }
}

double strtod(const char *nptr, char **endptr)
{
    const char *s = skip_ws(nptr);
    const char *start = s;
    int         neg = 0;
    double      val = 0.0;
    int         any = 0;

    if (*s == '+') {
        ++s;
    } else if (*s == '-') {
        neg = 1;
        ++s;
    }

    while (ulibc_isdigit((unsigned char)*s)) {
        any = 1;
        val = val * 10.0 + (double)(*s - '0');
        ++s;
    }
    if (*s == '.') {
        double f = 1.0;
        ++s;
        while (ulibc_isdigit((unsigned char)*s)) {
            any = 1;
            f *= 0.1;
            val += (double)(*s - '0') * f;
            ++s;
        }
    }
    if (*s == 'e' || *s == 'E') {
        int esign = 1;
        int expv  = 0;
        ++s;
        if (*s == '+') {
            ++s;
        } else if (*s == '-') {
            esign = -1;
            ++s;
        }
        while (ulibc_isdigit((unsigned char)*s)) {
            any = 1;
            if (expv <= 10000) {
                expv = expv * 10 + (*s - '0');
            }
            ++s;
        }
        val *= pow10_int(esign * expv);
    }

    if (endptr) {
        *endptr = (char *)(any ? s : start);
    }
    return neg ? -val : val;
}

float strtof(const char *nptr, char **endptr)
{
    return (float)strtod(nptr, endptr);
}
