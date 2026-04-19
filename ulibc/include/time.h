#ifndef ULIBC_TIME_H
#define ULIBC_TIME_H

#include <stddef.h>

typedef long           time_t;
typedef unsigned long  clock_t;

#ifndef CLOCKS_PER_SEC
#define CLOCKS_PER_SEC 1000u
#endif

#ifdef __cplusplus
extern "C" {
#endif

clock_t clock(void);

#ifdef __cplusplus
}
#endif

#endif /* ULIBC_TIME_H */
