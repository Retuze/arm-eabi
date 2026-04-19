#include <math.h>

double fabs(double x)
{
    return __builtin_fabs(x);
}

float fabsf(float x)
{
    return __builtin_fabsf(x);
}

double copysign(double x, double y)
{
    return __builtin_copysign(x, y);
}

float copysignf(float x, float y)
{
    return __builtin_copysignf(x, y);
}

double ceil(double x)
{
    return __builtin_ceil(x);
}

float ceilf(float x)
{
    return __builtin_ceilf(x);
}

double floor(double x)
{
    return __builtin_floor(x);
}

float floorf(float x)
{
    return __builtin_floorf(x);
}

double trunc(double x)
{
    return __builtin_trunc(x);
}

float truncf(float x)
{
    return __builtin_truncf(x);
}

double sqrt(double x)
{
    return __builtin_sqrt(x);
}

float sqrtf(float x)
{
    return __builtin_sqrtf(x);
}

double rint(double x)
{
    return __builtin_rint(x);
}

float rintf(float x)
{
    return __builtin_rintf(x);
}
