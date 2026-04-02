#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    volatile uint32_t R;
} SF32_REG32;

typedef struct {
    SF32_REG32 RSTR1;      /* 0x00 */
    SF32_REG32 ENR1;       /* 0x04 */
    SF32_REG32 ECR1;       /* 0x08 */
    SF32_REG32 ENR2;       /* 0x0C */
    SF32_REG32 ESR1;       /* 0x10 */
    SF32_REG32 ESR2;       /* 0x14 */
} HPSYS_RCC_TypeDef;

typedef struct {
    SF32_REG32 DIR0;       /* 0x00 */
    SF32_REG32 DOR0;       /* 0x04 */
    SF32_REG32 DOSR0;      /* 0x08 */
    SF32_REG32 DOCR0;      /* 0x0C */
    SF32_REG32 DOER0;      /* 0x10 */
    SF32_REG32 DOESR0;     /* 0x14 */
    SF32_REG32 DOECR0;     /* 0x18 */
    SF32_REG32 RESERVED0[25];
    SF32_REG32 DIR1;       /* 0x80 */
    SF32_REG32 DOR1;       /* 0x84 */
    SF32_REG32 DOSR1;      /* 0x88 */
    SF32_REG32 DOCR1;      /* 0x8C */
    SF32_REG32 DOER1;      /* 0x90 */
    SF32_REG32 DOESR1;     /* 0x94 */
    SF32_REG32 DOECR1;     /* 0x98 */
} HPSYS_GPIO_TypeDef;

#define HPSYS_RCC_BASE  (0x50000000UL)
#define HPSYS_GPIO_BASE (0x500A0000UL)

#define HPSYS_RCC  ((HPSYS_RCC_TypeDef *)HPSYS_RCC_BASE)
#define HPSYS_GPIO ((HPSYS_GPIO_TypeDef *)HPSYS_GPIO_BASE)

#ifdef __cplusplus
}
#endif
