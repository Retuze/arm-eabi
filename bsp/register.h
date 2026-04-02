#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define __IOM volatile

typedef struct {
    __IOM uint32_t RSTR1;
    __IOM uint32_t ENR1;
    __IOM uint32_t ECR1;
    __IOM uint32_t ENR2;
    __IOM uint32_t ESR1;
    __IOM uint32_t ESR2;
    __IOM uint32_t ECR2;
    __IOM uint32_t RSTR2;
    __IOM uint32_t CSR;
    __IOM uint32_t CFGR;
    __IOM uint32_t DLL2CR;
} HPSYS_RCC_TypeDef;

typedef struct {
    __IOM uint32_t PAD_SA00;
    __IOM uint32_t PAD_SA01;
    __IOM uint32_t PAD_SA02;
    __IOM uint32_t PAD_SA03;
    __IOM uint32_t PAD_SA04;
    __IOM uint32_t PAD_SA05;
    __IOM uint32_t PAD_SA06;
    __IOM uint32_t PAD_SA07;
    __IOM uint32_t PAD_SA08;
    __IOM uint32_t PAD_SA09;
    __IOM uint32_t PAD_SA10;
    __IOM uint32_t PAD_SA11;
    __IOM uint32_t PAD_SA12;
    __IOM uint32_t PAD_SA13;
    __IOM uint32_t PAD_SA14;
    __IOM uint32_t PAD_SA15;
    __IOM uint32_t PAD_SA16;
    __IOM uint32_t PAD_SA17;
    __IOM uint32_t PAD_SA18;
    __IOM uint32_t PAD_SA19;
    __IOM uint32_t PAD_SA20;
    __IOM uint32_t PAD_SA21;
    __IOM uint32_t PAD_SA22;
    __IOM uint32_t PAD_SA23;
    __IOM uint32_t PAD_SA24;
    __IOM uint32_t PAD_SA25;
    __IOM uint32_t PAD_SA26;
    __IOM uint32_t PAD_SA27;
    __IOM uint32_t PAD_SA28;
    __IOM uint32_t PAD_SA29;
    __IOM uint32_t PAD_SA30;
    __IOM uint32_t PAD_SA31;
} HPSYS_PINMUX_TypeDef;

typedef struct {
    __IOM uint32_t DIR0;
    __IOM uint32_t DOR0;
    __IOM uint32_t DOSR0;
    __IOM uint32_t DOCR0;
    __IOM uint32_t DOER0;
    __IOM uint32_t DOESR0;
    __IOM uint32_t DOECR0;
    uint32_t RESERVED0[25];
    __IOM uint32_t DIR1;
    __IOM uint32_t DOR1;
    __IOM uint32_t DOSR1;
    __IOM uint32_t DOCR1;
    __IOM uint32_t DOER1;
    __IOM uint32_t DOESR1;
    __IOM uint32_t DOECR1;
} GPIO1_TypeDef;

typedef struct {
    __IOM uint32_t HXT_CR1;
    uint32_t RESERVED0[15];
    __IOM uint32_t PERI_LDO;
} PMUC_TypeDef;

typedef struct {
    __IOM uint32_t ICTR;
} SCnSCB_Type;

typedef struct {
    __IOM uint32_t ISER[16];
    uint32_t RESERVED0[16];
    __IOM uint32_t ICER[16];
    uint32_t RESERVED1[16];
    __IOM uint32_t ISPR[16];
    uint32_t RESERVED2[16];
    __IOM uint32_t ICPR[16];
} NVIC_Type;

typedef struct {
    uint32_t RESERVED0[2];
    __IOM uint32_t VTOR;
} SCB_Type;

#define HPSYS_RCC_BASE      (0x50000000UL)
#define HPSYS_PINMUX1_BASE  (0x50003000UL)
#define GPIO1_BASE          (0x500A0000UL)
#define PMUC_BASE           (0x500CA000UL)

#define hwp_hpsys_rcc ((HPSYS_RCC_TypeDef *)HPSYS_RCC_BASE)
#define hwp_pinmux1   ((HPSYS_PINMUX_TypeDef *)HPSYS_PINMUX1_BASE)
#define hwp_pmuc      ((PMUC_TypeDef *)PMUC_BASE)

#define SCnSCB ((SCnSCB_Type *)0xE000E000UL)
#define NVIC   ((NVIC_Type *)0xE000E100UL)
#define SCB    ((SCB_Type *)0xE000ED00UL)

#define SET_BIT(REG, MASK) ((REG) |= (uint32_t)(MASK))
#define CLEAR_BIT(REG, MASK) ((REG) &= (uint32_t)~(MASK))
#define MODIFY_REG(REG, CLEARMASK, SETMASK) \
    ((REG) = (((REG) & (uint32_t)~(CLEARMASK)) | (uint32_t)(SETMASK)))

#define HPSYS_RCC_ENR1_PINMUX1       (1UL << 0)
#define HPSYS_RCC_ENR1_SYSCFG1       (1UL << 1)
#define HPSYS_RCC_ENR2_GPIO1         (1UL << 0)
#define HPSYS_RCC_ENR2_MPI2          (1UL << 1)

#define PMUC_HXT_CR1_EN              (1UL << 0)
#define PMUC_HXT_CR1_BUF_EN          (1UL << 1)
#define PMUC_HXT_CR1_BUF_DIG_EN      (1UL << 2)
#define PMUC_HXT_CR1_BUF_DLL_EN      (1UL << 3)
#define PMUC_HXT_CR1_GM_EN           (1UL << 4)
#define PMUC_PERI_LDO_EN_VDD33_LDO2  (1UL << 0)

#define HPSYS_RCC_DLL2CR_EN          (1UL << 0)
#define HPSYS_RCC_DLL2CR_SW          (1UL << 1)
#define HPSYS_RCC_DLL2CR_XTALIN_EN   (1UL << 2)
#define HPSYS_RCC_DLL2CR_OUT_DIV2_EN (1UL << 3)
#define HPSYS_RCC_DLL2CR_STG_Pos     4U
#define HPSYS_RCC_DLL2CR_PU_DLY_Pos  8U
#define HPSYS_RCC_DLL2CR_LOCK_DLY_Pos 12U

#define HPSYS_RCC_CFGR_HDIV_Pos      0U
#define HPSYS_RCC_CFGR_HDIV_Msk      (0xFUL << HPSYS_RCC_CFGR_HDIV_Pos)

#define HPSYS_PINMUX_PAD_SA00_FSEL_Pos 0U
#define HPSYS_PINMUX_PAD_SA00_FSEL_Msk (0xFUL << HPSYS_PINMUX_PAD_SA00_FSEL_Pos)
#define HPSYS_PINMUX_PAD_SA00_PE_Msk   (1UL << 4)
#define HPSYS_PINMUX_PAD_SA00_PS_Msk   (1UL << 5)
#define HPSYS_PINMUX_PAD_SA00_IE_Msk   (1UL << 6)
#define HPSYS_PINMUX_PAD_SA00_IS_Msk   (1UL << 7)
#define HPSYS_PINMUX_PAD_SA00_SR_Msk   (1UL << 8)
#define HPSYS_PINMUX_PAD_SA00_DS0_Msk  (1UL << 9)
#define HPSYS_PINMUX_PAD_SA00_DS1_Msk  (1UL << 10)

static inline void __DSB(void)
{
    __asm volatile ("dsb sy" ::: "memory");
}

static inline void __ISB(void)
{
    __asm volatile ("isb sy" ::: "memory");
}

static inline void __disable_irq(void)
{
    __asm volatile ("cpsid i" ::: "memory");
}

static inline void __enable_irq(void)
{
    __asm volatile ("cpsie i" ::: "memory");
}

static inline void __set_MSP(uint32_t top_of_main_stack)
{
    __asm volatile ("msr msp, %0" : : "r" (top_of_main_stack) : "memory");
}

#ifdef __cplusplus
}
#endif
