/*
 * ulibc — <math.h> subset for wasm3 / bare metal (implemented via Clang builtins).
 */
#ifndef ULIBC_MATH_H
#define ULIBC_MATH_H

#ifndef NAN
#define NAN __builtin_nanf("")
#endif

#ifdef __cplusplus
extern "C" {
#endif

double fabs(double x);
float  fabsf(float x);

double copysign(double x, double y);
float  copysignf(float x, float y);

double ceil(double x);
float  ceilf(float x);

double floor(double x);
float  floorf(float x);

double trunc(double x);
float  truncf(float x);

double sqrt(double x);
float  sqrtf(float x);

double rint(double x);
float  rintf(float x);

#define isnan(x)     __builtin_isnan((double)(x))
#define isfinite(x)  __builtin_isfinite((double)(x))
#define isinf(x)     __builtin_isinf((double)(x))
#define signbit(x)   __builtin_signbit((double)(x))

#ifdef __cplusplus
}
#endif

#endif /* ULIBC_MATH_H */
