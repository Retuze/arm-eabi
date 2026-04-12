#include "print.h"
#include <limits.h>
#include <stdint.h>

/* ----------- tiny helpers (no libc string.h) ----------- */

static size_t u_strlen(const char *s)
{
    size_t n = 0;
    while (s && s[n])
        ++n;
    return n;
}

static void u_memrev(char *a, size_t n)
{
    size_t i = 0, j = n;
    while (i < --j) {
        char t = a[i];
        a[i++] = a[j];
        a[j] = t;
    }
}

/* Emit unsigned decimal; returns digit count. buf must hold at least 10 chars for 32-bit. */
static unsigned u_utoa_dec(char *buf, unsigned v)
{
    unsigned n = 0;
    do {
        buf[n++] = (char)('0' + (v % 10u));
        v /= 10u;
    } while (v);
    u_memrev(buf, n);
    return n;
}

/* Signed decimal using safe INT_MIN trick (no long-long). */
static unsigned u_itoa_dec(char *buf, int v)
{
    if (v >= 0)
        return u_utoa_dec(buf, (unsigned)v);
    *buf++ = '-';
    {
        int t = v;
        unsigned u = (unsigned)(-(t + 1)) + 1u;
        unsigned n = u_utoa_dec(buf, u);
        return 1u + n;
    }
}

static size_t u_ulltoa_dec_ll(char *buf, unsigned long long v);

static unsigned u_ulltoa_hex_ll(char *buf, unsigned long long v, int upper)
{
    const char *d = upper ? "0123456789ABCDEF" : "0123456789abcdef";
    unsigned n = 0;
    do {
        buf[n++] = d[v & 0xFull];
        v >>= 4;
    } while (v);
    u_memrev(buf, n);
    return n;
}

/* Windows/UCRT %p: fixed-width uppercase hex, no 0x (matches snprintf). */
static size_t u_ptr_fmt(char *buf, size_t cap, const void *p)
{
    uintptr_t v = (uintptr_t)(const unsigned char *)p;
    size_t n = sizeof(void *) * 2;
    size_t i;
    if (cap < n)
        return 0;
    for (i = n; i > 0;) {
        --i;
        buf[i] = "0123456789ABCDEF"[(int)(v & 0xFu)];
        v >>= 4;
    }
    return n;
}

typedef struct {
    int (*raw_write)(void *ctx, const char *p, size_t n);
    void *ctx;
    size_t total;
} UFmtCtx;

static int ufmt_emit(UFmtCtx *f, const char *p, size_t n)
{
    int r = f->raw_write(f->ctx, p, n);
    if (r < 0)
        return r;
    f->total += (size_t)r;
    return 0;
}

static int ufmt_emit_c(UFmtCtx *f, char c)
{
    return ufmt_emit(f, &c, 1u);
}

static int ufmt_emit_pad(UFmtCtx *f, char c, size_t n)
{
    for (; n > 0u; n--) {
        if (ufmt_emit_c(f, c) != 0)
            return -1;
    }
    return 0;
}

typedef struct {
    unsigned width;
    unsigned prec;
    unsigned left : 1;
    unsigned plus : 1;
    unsigned space : 1;
    unsigned alt : 1;
    unsigned zeropad : 1;
    unsigned has_prec : 1;
    unsigned char len; /* UFMT_LEN_* : drives va_arg width for d i u x X */
} USpec;

#define UFMT_LEN_NONE 0u
#define UFMT_LEN_h 1u
#define UFMT_LEN_hh 2u
#define UFMT_LEN_l 3u
#define UFMT_LEN_ll 4u
#define UFMT_LEN_z 5u
#define UFMT_LEN_j 6u
#define UFMT_LEN_t 7u

static const char *ufmt_parse_u(const char *s, unsigned *vp)
{
    unsigned x = 0;
    if (!s || *s < '0' || *s > '9') {
        *vp = 0;
        return s;
    }
    while (*s >= '0' && *s <= '9')
        x = x * 10u + (unsigned)(*s++ - '0');
    *vp = x;
    return s;
}

static const char *ufmt_parse_conv(const char *s, USpec *sp, va_list *app)
{
    *sp = (USpec){0};
    for (;;) {
        char c = *s;
        if (c == '-') {
            sp->left = 1;
            s++;
            continue;
        }
        if (c == '+') {
            sp->plus = 1;
            s++;
            continue;
        }
        if (c == ' ') {
            sp->space = 1;
            s++;
            continue;
        }
        if (c == '#') {
            sp->alt = 1;
            s++;
            continue;
        }
        if (c == '0') {
            sp->zeropad = 1;
            s++;
            continue;
        }
        break;
    }
    if (*s == '*') {
        int w = va_arg(*app, int);
        s++;
        if (w < 0) {
            sp->left = 1;
            if (w == INT_MIN)
                sp->width = (unsigned)INT_MAX + 1u;
            else
                sp->width = (unsigned)(-w);
        } else
            sp->width = (unsigned)w;
    } else
        s = ufmt_parse_u(s, &sp->width);
    if (*s == '.') {
        s++;
        if (*s == '*') {
            int p = va_arg(*app, int);
            s++;
            if (p < 0)
                sp->has_prec = 0;
            else {
                sp->has_prec = 1;
                sp->prec = (unsigned)p;
            }
        } else {
            sp->has_prec = 1;
            s = ufmt_parse_u(s, &sp->prec);
        }
    }
    sp->len = UFMT_LEN_NONE;
    for (;;) {
        if (*s == 'h' && s[1] == 'h') {
            sp->len = UFMT_LEN_hh;
            s += 2;
            continue;
        }
        if (*s == 'h') {
            sp->len = UFMT_LEN_h;
            s++;
            continue;
        }
        if (*s == 'l' && s[1] == 'l') {
            sp->len = UFMT_LEN_ll;
            s += 2;
            continue;
        }
        if (*s == 'l') {
            sp->len = UFMT_LEN_l;
            s++;
            continue;
        }
        if (*s == 'z') {
            sp->len = UFMT_LEN_z;
            s++;
            continue;
        }
        if (*s == 'j') {
            sp->len = UFMT_LEN_j;
            s++;
            continue;
        }
        if (*s == 't') {
            sp->len = UFMT_LEN_t;
            s++;
            continue;
        }
        if (*s == 'L') {
            s++;
            continue;
        }
        break;
    }
    /* '+' overrides ' ' (C rules) */
    if (sp->plus)
        sp->space = 0;
    return s;
}

static int ufmt_narrow_sint(int v, unsigned char len)
{
    switch (len) {
    case UFMT_LEN_hh:
        return (int)(signed char)(unsigned char)(unsigned)v;
    case UFMT_LEN_h:
        return (int)(short)(unsigned short)(unsigned)v;
    default:
        return v;
    }
}

static unsigned ufmt_narrow_uint(unsigned v, unsigned char len)
{
    switch (len) {
    case UFMT_LEN_hh:
        return (unsigned)(unsigned char)v;
    case UFMT_LEN_h:
        return (unsigned)(unsigned short)v;
    default:
        return v;
    }
}

static intmax_t ufmt_va_sint(unsigned char len, va_list *app)
{
    switch (len) {
    case UFMT_LEN_hh: {
        int v = va_arg(*app, int);
        return (intmax_t)ufmt_narrow_sint(v, UFMT_LEN_hh);
    }
    case UFMT_LEN_h: {
        int v = va_arg(*app, int);
        return (intmax_t)ufmt_narrow_sint(v, UFMT_LEN_h);
    }
    case UFMT_LEN_l:
        return (intmax_t)va_arg(*app, long);
    case UFMT_LEN_ll:
        return (intmax_t)va_arg(*app, long long);
    case UFMT_LEN_z:
        return (intmax_t)va_arg(*app, ptrdiff_t);
    case UFMT_LEN_j:
        return (intmax_t)va_arg(*app, intmax_t);
    case UFMT_LEN_t:
        return (intmax_t)va_arg(*app, ptrdiff_t);
    default:
        return (intmax_t)va_arg(*app, int);
    }
}

static uintmax_t ufmt_va_uint(unsigned char len, va_list *app)
{
    switch (len) {
    case UFMT_LEN_hh:
        return (uintmax_t)ufmt_narrow_uint((unsigned)va_arg(*app, int), UFMT_LEN_hh);
    case UFMT_LEN_h:
        return (uintmax_t)ufmt_narrow_uint((unsigned)va_arg(*app, int), UFMT_LEN_h);
    case UFMT_LEN_l:
        return (uintmax_t)va_arg(*app, unsigned long);
    case UFMT_LEN_ll:
        return (uintmax_t)va_arg(*app, unsigned long long);
    case UFMT_LEN_z:
        return (uintmax_t)va_arg(*app, size_t);
    case UFMT_LEN_j:
        return (uintmax_t)va_arg(*app, uintmax_t);
    case UFMT_LEN_t: {
        ptrdiff_t d = va_arg(*app, ptrdiff_t);
        return (uintmax_t)d;
    }
    default:
        return (uintmax_t)va_arg(*app, unsigned);
    }
}

static unsigned u_umaxtoa_oct(char *buf, uintmax_t v)
{
    unsigned n = 0;
    if (v == 0u) {
        buf[0] = '0';
        return 1u;
    }
    while (v) {
        buf[n++] = (char)('0' + (char)(v & (uintmax_t)7));
        v >>= 3;
    }
    u_memrev(buf, n);
    return n;
}

static int ufmt_emit_sintmax_dec(UFmtCtx *f, intmax_t v, const USpec *sp)
{
    char dig[64];
    unsigned nd;
    unsigned min_d;
    char signc = 0;
    long long sv;
    int neg;
    int err = 0;
    int zeropad_e = sp->zeropad && !sp->left && !sp->has_prec;
    unsigned wid = sp->width;
    unsigned core_len;
    unsigned sign_len;

    sv = (long long)v;
    neg = sv < 0;
    if (neg)
        signc = '-';
    else if (sp->plus)
        signc = '+';
    else if (sp->space)
        signc = ' ';

    min_d = sp->has_prec ? sp->prec : 1u;

    if (sv == 0 && sp->has_prec && sp->prec == 0) {
        nd = 0;
    } else {
        unsigned long long mag;
        if (!neg)
            mag = (unsigned long long)sv;
        else
            mag = (unsigned long long)(-(sv + 1)) + 1ull;
        nd = (unsigned)u_ulltoa_dec_ll(dig, mag);
        if (nd < min_d) {
            unsigned padz = min_d - nd;
            unsigned i;
            if (padz + nd > sizeof(dig))
                padz = (unsigned)(sizeof(dig) - nd);
            for (i = nd; i > 0; i--)
                dig[padz + i - 1] = dig[i - 1];
            for (i = 0; i < padz; i++)
                dig[i] = '0';
            nd = nd + padz;
        }
    }

    sign_len = signc ? 1u : 0u;
    core_len = sign_len + nd;

    if (sp->left) {
        if (signc)
            err = ufmt_emit_c(f, signc);
        if (!err && nd)
            err = ufmt_emit(f, dig, (size_t)nd);
        if (!err)
            err = ufmt_emit_pad(f, ' ', wid > core_len ? (size_t)(wid - core_len) : 0u);
        return err;
    }
    if (zeropad_e) {
        unsigned ez = wid > core_len ? wid - core_len : 0;
        if (signc)
            err = ufmt_emit_c(f, signc);
        if (!err)
            err = ufmt_emit_pad(f, '0', (size_t)ez);
        if (!err && nd)
            err = ufmt_emit(f, dig, (size_t)nd);
        return err;
    }
    {
        unsigned ps = wid > core_len ? wid - core_len : 0;
        err = ufmt_emit_pad(f, ' ', (size_t)ps);
        if (!err && signc)
            err = ufmt_emit_c(f, signc);
        if (!err && nd)
            err = ufmt_emit(f, dig, (size_t)nd);
        return err;
    }
}

static int ufmt_emit_uintmax_conv(UFmtCtx *f, uintmax_t v, int base, int upper, const USpec *sp)
{
    char dig[64];
    unsigned nd;
    unsigned min_d;
    const char *pfx = 0;
    unsigned pfxl = 0;
    int err = 0;
    int zeropad_e = sp->zeropad && !sp->left && !sp->has_prec;
    unsigned wid = sp->width;

    if (base == 16 && sp->alt && v != 0) {
        pfx = upper ? "0X" : "0x";
        pfxl = 2;
    }

    min_d = sp->has_prec ? sp->prec : 1u;

    if (v == 0 && sp->has_prec && sp->prec == 0)
        nd = 0;
    else {
        if (base == 16)
            nd = u_ulltoa_hex_ll(dig, (unsigned long long)v, upper);
        else if (base == 8)
            nd = u_umaxtoa_oct(dig, v);
        else
            nd = (unsigned)u_ulltoa_dec_ll(dig, (unsigned long long)v);
        if (nd < min_d) {
            unsigned padz = min_d - nd;
            unsigned i;
            if (padz + nd > sizeof(dig))
                padz = (unsigned)(sizeof(dig) - nd);
            for (i = nd; i > 0; i--)
                dig[padz + i - 1] = dig[i - 1];
            for (i = 0; i < padz; i++)
                dig[i] = '0';
            nd = nd + padz;
        }
    }

    if (base == 8 && sp->alt && v != 0u && nd > 0u && dig[0] != '0') {
        pfx = "0";
        pfxl = 1;
    }

    if (sp->left) {
        if (pfxl)
            err = ufmt_emit(f, pfx, (size_t)pfxl);
        if (!err && nd)
            err = ufmt_emit(f, dig, (size_t)nd);
        if (!err)
            err = ufmt_emit_pad(f, ' ', wid > pfxl + nd ? (size_t)(wid - pfxl - nd) : 0u);
        return err;
    }
    if (zeropad_e) {
        unsigned extra = wid > pfxl + nd ? wid - pfxl - nd : 0;
        if (pfxl)
            err = ufmt_emit(f, pfx, (size_t)pfxl);
        if (!err)
            err = ufmt_emit_pad(f, '0', (size_t)extra);
        if (!err && nd)
            err = ufmt_emit(f, dig, (size_t)nd);
        return err;
    }
    {
        unsigned core_len = pfxl + nd;
        unsigned ps = wid > core_len ? wid - core_len : 0;
        err = ufmt_emit_pad(f, ' ', (size_t)ps);
        if (!err && pfxl)
            err = ufmt_emit(f, pfx, (size_t)pfxl);
        if (!err && nd)
            err = ufmt_emit(f, dig, (size_t)nd);
        return err;
    }
}

/* Plain body (no sign): width / pad. UCRT %s/%c: '0' pads to width even with .precision when zpad_with_prec. */
static int ufmt_emit_padded_field(UFmtCtx *f, const char *body, size_t body_len, const USpec *sp, int zpad_with_prec)
{
    unsigned wid = sp->width;
    unsigned bl = (unsigned)body_len;
    unsigned core = bl;
    int zeropad_e = sp->zeropad && !sp->left && (zpad_with_prec || !sp->has_prec);
    int err = 0;

    if (sp->left) {
        if (body_len)
            err = ufmt_emit(f, body, body_len);
        if (!err)
            err = ufmt_emit_pad(f, ' ', wid > core ? (size_t)(wid - core) : 0u);
        return err;
    }
    if (zeropad_e) {
        err = ufmt_emit_pad(f, '0', wid > core ? (size_t)(wid - core) : 0u);
        if (!err && body_len)
            err = ufmt_emit(f, body, body_len);
        return err;
    }
    {
        unsigned ps = wid > core ? wid - core : 0;
        err = ufmt_emit_pad(f, ' ', (size_t)ps);
        if (!err && body_len)
            err = ufmt_emit(f, body, body_len);
        return err;
    }
}

static int ufmt_emit_p(UFmtCtx *f, void *p, const USpec *sp)
{
    char buf[32];
    size_t n = u_ptr_fmt(buf, sizeof buf, p);
    USpec sp2;
    if (n == 0u)
        return -1;
    /* UCRT: width padding for %p uses spaces; '0' does not zero-pad the field like integers. */
    sp2 = *sp;
    sp2.zeropad = 0;
    sp2.plus = 0;
    sp2.space = 0;
    return ufmt_emit_padded_field(f, buf, n, &sp2, 0);
}

static int ufmt_emit_str(UFmtCtx *f, const char *s, const USpec *sp)
{
    size_t slen = u_strlen(s);
    if (sp->has_prec && sp->prec < slen)
        slen = sp->prec;
    return ufmt_emit_padded_field(f, s, slen, sp, 1);
}

static int ufmt_emit_char_conv(UFmtCtx *f, int ch, const USpec *sp)
{
    char b[1];
    b[0] = (char)(unsigned char)ch;
    return ufmt_emit_padded_field(f, b, 1u, sp, 1);
}

static int u_dbl_signbit(double x)
{
    union {
        double d;
        uint64_t u;
    } v;
    v.d = x;
    return (int)(v.u >> 63);
}

static int u_dbl_isnan(double x)
{
    union {
        double d;
        uint64_t u;
    } v;
    uint64_t e, m;
    v.d = x;
    e = (v.u >> 52) & 0x7FFull;
    m = v.u & (((uint64_t)1 << 52) - 1ull);
    return e == 0x7FFull && m != 0ull;
}

static int u_dbl_isinf(double x)
{
    union {
        double d;
        uint64_t u;
    } v;
    uint64_t e, m;
    v.d = x;
    e = (v.u >> 52) & 0x7FFull;
    m = v.u & (((uint64_t)1 << 52) - 1ull);
    return e == 0x7FFull && m == 0ull;
}

static double u_dbl_abs(double x)
{
    union {
        double d;
        uint64_t u;
    } v;
    v.d = x;
    v.u &= (((uint64_t)1 << 63) - 1ull);
    return v.d;
}

/* Non-negative ax; trunc toward 0. Exact for ax < 2^53; else iptr=ax, frac=0 (rare for %f). */
static double u_modf_pos_d(double ax, double *iptr)
{
    const double two53 = 9007199254740992.0; /* 1<<53 */
    if (!(ax < two53)) {
        *iptr = ax;
        return 0.0;
    }
    {
        uint64_t w = (uint64_t)ax;
        *iptr = (double)w;
        return ax - *iptr;
    }
}

static double u_pow10_nonneg(int n)
{
    double r = 1.0;
    int i;
    for (i = 0; i < n; i++)
        r *= 10.0;
    return r;
}

static unsigned long long u_ull_round_half_away_nonneg(double x)
{
    if (!(x == x) || x <= 0.0)
        return 0ull;
    if (x >= 18446744073709551615.0)
        return 18446744073709551615ull;
    return (unsigned long long)(x + 0.5);
}

static size_t u_put_u64dec(char *buf, uint64_t v)
{
    size_t n = 0;
    do {
        buf[n++] = (char)('0' + (char)(v % 10ull));
        v /= 10ull;
    } while (v);
    u_memrev(buf, n);
    return n;
}

/* %f numeric body: '0' pads after sign even when .precision is present (UCRT). */
static int ufmt_emit_padded_signed_float(UFmtCtx *f, char signc, const char *body, size_t body_len,
    const USpec *sp)
{
    unsigned wid = sp->width;
    unsigned sign_len = signc ? 1u : 0u;
    unsigned bl = (unsigned)body_len;
    unsigned core = sign_len + bl;
    int zeropad_e = sp->zeropad && !sp->left;
    int err = 0;

    if (sp->left) {
        if (signc)
            err = ufmt_emit_c(f, signc);
        if (!err && body_len)
            err = ufmt_emit(f, body, body_len);
        if (!err)
            err = ufmt_emit_pad(f, ' ', wid > core ? (size_t)(wid - core) : 0u);
        return err;
    }
    if (zeropad_e) {
        if (signc)
            err = ufmt_emit_c(f, signc);
        if (!err)
            err = ufmt_emit_pad(f, '0', wid > core ? (size_t)(wid - core) : 0u);
        if (!err && body_len)
            err = ufmt_emit(f, body, body_len);
        return err;
    }
    {
        unsigned ps = wid > core ? wid - core : 0;
        err = ufmt_emit_pad(f, ' ', (size_t)ps);
        if (!err && signc)
            err = ufmt_emit_c(f, signc);
        if (!err && body_len)
            err = ufmt_emit(f, body, body_len);
        return err;
    }
}

/* %f / %F: full double (C varargs promotion; matches UCRT snprintf). */
static int ufmt_emit_double_f(UFmtCtx *f, double x, const USpec *sp, int upper)
{
    int prec = sp->has_prec ? (int)sp->prec : 6;
    char body[384];
    size_t bl = 0;
    size_t i;

    if (prec < 0)
        prec = 0;
    if (prec > 50)
        prec = 50;

    if (u_dbl_isnan(x)) {
        if (u_dbl_signbit(x)) {
            const char *s = upper ? "-NAN(IND)" : "-nan(ind)";
            return ufmt_emit_padded_signed_float(f, 0, s, 9u, sp);
        }
        {
            const char *s = upper ? "NAN" : "nan";
            return ufmt_emit_padded_signed_float(f, 0, s, 3u, sp);
        }
    }
    if (u_dbl_isinf(x)) {
        char iw[16];
        size_t w = 0;
        if (u_dbl_signbit(x))
            iw[w++] = '-';
        else if (sp->plus)
            iw[w++] = '+';
        else if (sp->space)
            iw[w++] = ' ';
        {
            const char *s = upper ? "INF" : "inf";
            while (*s && w < sizeof iw - 1)
                iw[w++] = *s++;
        }
        return ufmt_emit_padded_signed_float(f, 0, iw, w, sp);
    }

    {
        char signc = 0;
        double ax = u_dbl_abs(x);
        double ipw;
        double fpart = u_modf_pos_d(ax, &ipw);
        double ipd = ipw;
        double mult = u_pow10_nonneg(prec);
        unsigned long long fr;
        unsigned long long lim;
        uint64_t ip;
        char idigs[32];
        size_t il;

        if (u_dbl_signbit(x))
            signc = '-';
        else if (sp->plus)
            signc = '+';
        else if (sp->space)
            signc = ' ';

        if (!(mult == mult) || mult <= 0.0 || ipd < 0.0 || ipd > 1.8e19 || !(ipd == ipd))
            return ufmt_emit_padded_signed_float(f, signc, "?", 1, sp);

        fr = u_ull_round_half_away_nonneg(fpart * mult);
        lim = (unsigned long long)mult;
        while (fr >= lim) {
            fr -= lim;
            ipd += 1.0;
        }

        ip = (uint64_t)ipd;
        il = u_put_u64dec(idigs, ip);
        for (i = 0; i < il && bl < sizeof body - 1; i++)
            body[bl++] = idigs[i];

        if (prec > 0) {
            if (bl + (size_t)prec + 1u >= sizeof body)
                return ufmt_emit_padded_signed_float(f, signc, "?", 1, sp);
            body[bl++] = '.';
            for (i = 0; i < (size_t)prec; i++) {
                body[bl + (size_t)prec - 1u - i] = (char)('0' + (char)(fr % 10ull));
                fr /= 10ull;
            }
            bl += (size_t)prec;
        } else if (sp->alt)
            body[bl++] = '.';

        return ufmt_emit_padded_signed_float(f, signc, body, bl, sp);
    }
}

static int ufmt_main(UFmtCtx *f, const char *fmt, va_list ap)
{
    const char *lit = fmt;
    int err = 0;

    while (*fmt && !err) {
        if (*fmt != '%') {
            ++fmt;
            continue;
        }
        if (fmt > lit)
            err = ufmt_emit(f, lit, (size_t)(fmt - lit));
        if (err)
            break;
        ++fmt; /* '%' */
        if (*fmt == '%') {
            err = ufmt_emit_c(f, '%');
            ++fmt;
            lit = fmt;
            continue;
        }
        {
            USpec sp;
            fmt = ufmt_parse_conv(fmt, &sp, &ap);
            {
                char spec = *fmt++;
                if (spec == 'c') {
                    int ch;
                    if (sp.len == UFMT_LEN_l || sp.len == UFMT_LEN_ll)
                        ch = va_arg(ap, int); /* wint_t */
                    else
                        ch = va_arg(ap, int);
                    err = ufmt_emit_char_conv(f, ch, &sp);
                } else if (spec == 's') {
                    const char *s = va_arg(ap, const char *);
                    if (!s)
                        s = "(null)";
                    err = ufmt_emit_str(f, s, &sp);
                } else if (spec == 'd' || spec == 'i') {
                    intmax_t v = ufmt_va_sint(sp.len, &ap);
                    err = ufmt_emit_sintmax_dec(f, v, &sp);
                } else if (spec == 'u') {
                    uintmax_t v = ufmt_va_uint(sp.len, &ap);
                    err = ufmt_emit_uintmax_conv(f, v, 10, 0, &sp);
                } else if (spec == 'x') {
                    uintmax_t v = ufmt_va_uint(sp.len, &ap);
                    err = ufmt_emit_uintmax_conv(f, v, 16, 0, &sp);
                } else if (spec == 'X') {
                    uintmax_t v = ufmt_va_uint(sp.len, &ap);
                    err = ufmt_emit_uintmax_conv(f, v, 16, 1, &sp);
                } else if (spec == 'f' || spec == 'F') {
                    double dv = va_arg(ap, double);
                    err = ufmt_emit_double_f(f, dv, &sp, spec == 'F');
                } else if (spec == 'p') {
                    void *p = va_arg(ap, void *);
                    err = ufmt_emit_p(f, p, &sp);
                } else {
                    err = ufmt_emit_c(f, '%');
                    if (!err && spec)
                        err = ufmt_emit_c(f, spec);
                }
            }
        }
        lit = fmt;
    }
    if (!err && fmt > lit)
        err = ufmt_emit(f, lit, (size_t)(fmt - lit));

    return err;
}

/* ----------- u_write backend ----------- */

static int sink_write_raw(void *ctx, const char *p, size_t n)
{
    (void)ctx;
    if (n == 0)
        return 0;
    {
        int w = u_write(p, n);
        if (w < 0)
            return w;
        if ((size_t)w != n)
            return -1;
        return (int)n;
    }
}

int u_vprintf(const char *fmt, va_list ap)
{
    UFmtCtx f = {sink_write_raw, 0, (size_t)0};
    if (ufmt_main(&f, fmt, ap) != 0)
        return -1;
    return (int)f.total;
}

int u_printf(const char *fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    {
        int r = u_vprintf(fmt, ap);
        va_end(ap);
        return r;
    }
}

typedef struct {
    char *cur;
    size_t remain; /* bytes still allowed to copy before final NUL */
} SNCtx;

static int sink_sn_raw(void *ctx, const char *src, size_t n)
{
    SNCtx *s = (SNCtx *)ctx;
    size_t i;
    for (i = 0u; i < n; i++) {
        if (s->remain > 0u) {
            *s->cur++ = src[i];
            --s->remain;
        }
    }
    return (int)n;
}

int u_vsnprintf(char *buf, size_t bufsize, const char *fmt, va_list ap)
{
    SNCtx s;
    UFmtCtx f;
    size_t total;
    if (bufsize == 0u) {
        s.cur = 0;
        s.remain = 0u;
    } else {
        s.cur = buf;
        s.remain = bufsize - 1u;
    }
    f.raw_write = sink_sn_raw;
    f.ctx = &s;
    f.total = 0u;
    if (ufmt_main(&f, fmt, ap) != 0) {
        if (bufsize != 0u)
            *buf = '\0';
        return -1;
    }
    total = f.total;
    if (bufsize != 0u)
        *s.cur = '\0';
    return (int)total;
}

int u_snprintf(char *buf, size_t bufsize, const char *fmt, ...)
{
    va_list ap;
    int r;
    va_start(ap, fmt);
    r = u_vsnprintf(buf, bufsize, fmt, ap);
    va_end(ap);
    return r;
}

/* -------- print_* helpers: ll decimal + default %f-style (u_dtoa_dec, no libc format) -------- */

static size_t u_ulltoa_dec_ll(char *buf, unsigned long long v)
{
    size_t n = 0;
    do {
        buf[n++] = (char)('0' + (unsigned)(v % 10ull));
        v /= 10ull;
    } while (v);
    u_memrev(buf, n);
    return n;
}

static size_t u_slltoa(char *buf, long long v)
{
    if (v >= 0)
        return u_ulltoa_dec_ll(buf, (unsigned long long)v);
    *buf++ = '-';
    {
        unsigned long long u = (unsigned long long)(-(v + 1)) + 1ull;
        size_t n = u_ulltoa_dec_ll(buf, u);
        return 1u + n;
    }
}

/* Double → decimal ASCII (default %f: 6 digits after '.'). Same finite path as ufmt_emit_double_f; NaN/inf = UCRT. */
static size_t u_dtoa_dec(char *buf, size_t cap, double x)
{
    enum { PREC = 6 };
    const char *s;
    size_t n, i, bl, il;
    char signc;
    double ax, ipw, fpart;
    double ipd, mult;
    unsigned long long fr, lim;
    uint64_t ip;
    char idigs[32];
    char body[40];

    if (u_dbl_isnan(x)) {
        if (u_dbl_signbit(x)) {
            s = "-nan(ind)";
            n = 9u;
        } else {
            s = "nan";
            n = 3u;
        }
        if (n > cap)
            return 0u;
        for (i = 0u; i < n; i++)
            buf[i] = s[i];
        return n;
    }
    if (u_dbl_isinf(x)) {
        if (u_dbl_signbit(x)) {
            if (cap < 4u)
                return 0u;
            buf[0] = '-';
            buf[1] = 'i';
            buf[2] = 'n';
            buf[3] = 'f';
            return 4u;
        }
        if (cap < 3u)
            return 0u;
        buf[0] = 'i';
        buf[1] = 'n';
        buf[2] = 'f';
        return 3u;
    }

    signc = 0;
    ax = u_dbl_abs(x);
    fpart = u_modf_pos_d(ax, &ipw);
    ipd = ipw;
    mult = u_pow10_nonneg(PREC);
    if (u_dbl_signbit(x))
        signc = '-';

    if (!(mult == mult) || mult <= 0.0 || ipd < 0.0 || ipd > 1.8e19 || !(ipd == ipd)) {
        if (cap < 1u)
            return 0u;
        if (signc) {
            if (cap < 2u)
                return 0u;
            buf[0] = signc;
            buf[1] = '?';
            return 2u;
        }
        buf[0] = '?';
        return 1u;
    }

    fr = u_ull_round_half_away_nonneg(fpart * mult);
    lim = (unsigned long long)mult;
    while (fr >= lim) {
        fr -= lim;
        ipd += 1.0;
    }

    ip = (uint64_t)ipd;
    il = u_put_u64dec(idigs, ip);
    bl = 0;
    for (i = 0u; i < il && bl < sizeof body; i++)
        body[bl++] = idigs[i];

    if (PREC > 0) {
        if (bl + (size_t)PREC + 1u > sizeof body) {
            if (cap < 1u)
                return 0u;
            if (signc) {
                if (cap < 2u)
                    return 0u;
                buf[0] = signc;
                buf[1] = '?';
                return 2u;
            }
            buf[0] = '?';
            return 1u;
        }
        body[bl++] = '.';
        for (i = 0u; i < (size_t)PREC; i++) {
            body[bl + (size_t)PREC - 1u - i] = (char)('0' + (char)(fr % 10ull));
            fr /= 10ull;
        }
        bl += (size_t)PREC;
    }

    {
        size_t total, wi;
        total = (signc ? 1u : 0u) + bl;
        if (total > cap)
            return 0u;
        wi = 0;
        if (signc)
            buf[wi++] = signc;
        for (i = 0u; i < bl; i++)
            buf[wi++] = body[i];
        return wi;
    }
}

void print_int(int x)
{
    char b[12];
    unsigned n = u_itoa_dec(b, x);
    (void)u_write(b, (size_t)n);
}

void print_uint(unsigned int x)
{
    char b[11];
    unsigned n = u_utoa_dec(b, x);
    (void)u_write(b, (size_t)n);
}

void print_long(long x)
{
    char b[22];
    size_t n = u_slltoa(b, (long long)x);
    (void)u_write(b, n);
}

void print_ulong(unsigned long x)
{
    char b[22];
    size_t n = u_ulltoa_dec_ll(b, (unsigned long long)x);
    (void)u_write(b, n);
}

void print_llong(long long x)
{
    char b[22];
    size_t n = u_slltoa(b, x);
    (void)u_write(b, n);
}

void print_ullong(unsigned long long x)
{
    char b[22];
    size_t n = u_ulltoa_dec_ll(b, x);
    (void)u_write(b, n);
}

void print_double(double x)
{
    char b[48];
    size_t n = u_dtoa_dec(b, sizeof b, x);
    if (n > 0u)
        (void)u_write(b, n);
}

void print_float(float x)
{
    print_double((double)x);
}

void print_bool(bool x)
{
    if (x)
        (void)u_write("true", 4);
    else
        (void)u_write("false", 5);
}

void print_string(const char *s)
{
    if (!s)
        s = "(null)";
    (void)u_write(s, u_strlen(s));
}

void print_ptr(const void *p)
{
    char buf[32];
    size_t n = u_ptr_fmt(buf, sizeof buf, p);
    if (n > 0u)
        (void)u_write(buf, n);
}

void print_unknown(void)
{
    (void)u_write("?", 1);
}
