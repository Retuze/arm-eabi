#pragma once

#include <stdint.h>

typedef enum {
    SF32_RCC_MOD_PINMUX1 = 0,
    SF32_RCC_MOD_SYSCFG1,
    SF32_RCC_MOD_GPIO1,
    SF32_RCC_MOD_GPTIM1,
    SF32_RCC_MOD_GPTIM2,
    SF32_RCC_MOD_BTIM1,
    SF32_RCC_MOD_BTIM2,
    SF32_RCC_MOD_SPI1,
    SF32_RCC_MOD_SPI2,
    SF32_RCC_MOD_I2C1,
    SF32_RCC_MOD_I2C2,
    SF32_RCC_MOD_I2C3,
    SF32_RCC_MOD_I2C4,
    SF32_RCC_MOD_USART3,
    SF32_RCC_MOD_MPI2,
} sf32_rcc_module_t;

typedef enum {
    SF32_RCC_CLK_MOD_SYS = 0,
    SF32_RCC_CLK_MOD_MPI2 = 6,
    SF32_RCC_CLK_MOD_HP_PERI = 12,
} sf32_rcc_clock_module_t;

void sf32_rcc_enable_module(sf32_rcc_module_t module);
void sf32_rcc_disable_module(sf32_rcc_module_t module);
void sf32_rcc_reset_module(sf32_rcc_module_t module);
void sf32_rcc_select_clock(sf32_rcc_clock_module_t module, uint32_t source);
void sf32_rcc_enable_hxt48(void);
void sf32_rcc_enable_dll2_288m(void);
void sf32_rcc_set_hclk_div(uint32_t div);

#define HPSYS_RCC_ENR1_PINMUX1   (1UL << 2)
#define HPSYS_RCC_ENR1_SYSCFG1   (1UL << 10)
#define HPSYS_RCC_ENR1_GPTIM1    (1UL << 15)
#define HPSYS_RCC_ENR1_GPTIM2    (1UL << 16)
#define HPSYS_RCC_ENR1_BTIM1     (1UL << 17)
#define HPSYS_RCC_ENR1_BTIM2     (1UL << 18)
#define HPSYS_RCC_ENR1_SPI1      (1UL << 20)
#define HPSYS_RCC_ENR1_SPI2      (1UL << 21)
#define HPSYS_RCC_ENR1_I2C1      (1UL << 27)
#define HPSYS_RCC_ENR1_I2C2      (1UL << 28)
#define HPSYS_RCC_ENR2_GPIO1     (1UL << 0)
#define HPSYS_RCC_ENR2_MPI2      (1UL << 2)
#define HPSYS_RCC_ENR2_I2C3      (1UL << 8)
#define HPSYS_RCC_ENR2_USART3    (1UL << 12)
#define HPSYS_RCC_ENR2_I2C4      (1UL << 25)

#define HPSYS_RCC_CSR_SEL_SYS_Pos    0U
#define HPSYS_RCC_CSR_SEL_SYS_Msk    (0x3UL << HPSYS_RCC_CSR_SEL_SYS_Pos)
#define HPSYS_RCC_CSR_SEL_MPI2_Pos   6U
#define HPSYS_RCC_CSR_SEL_MPI2_Msk   (0x3UL << HPSYS_RCC_CSR_SEL_MPI2_Pos)
#define HPSYS_RCC_CSR_SEL_PERI_Pos   12U
#define HPSYS_RCC_CSR_SEL_PERI_Msk   (0x1UL << HPSYS_RCC_CSR_SEL_PERI_Pos)

#define HPSYS_RCC_CFGR_HDIV_Pos      0U
#define HPSYS_RCC_CFGR_HDIV_Msk      (0xFFUL << HPSYS_RCC_CFGR_HDIV_Pos)

#define HPSYS_RCC_DLL2CR_EN          (1UL << 0)
#define HPSYS_RCC_DLL2CR_SW          (1UL << 1)
#define HPSYS_RCC_DLL2CR_STG_Pos     2U
#define HPSYS_RCC_DLL2CR_STG_Msk     (0xFUL << HPSYS_RCC_DLL2CR_STG_Pos)
#define HPSYS_RCC_DLL2CR_XTALIN_EN   (1UL << 6)
#define HPSYS_RCC_DLL2CR_OUT_DIV2_EN (1UL << 13)
#define HPSYS_RCC_DLL2CR_PU_DLY_Pos  25U
#define HPSYS_RCC_DLL2CR_PU_DLY_Msk  (0x7UL << HPSYS_RCC_DLL2CR_PU_DLY_Pos)
#define HPSYS_RCC_DLL2CR_LOCK_DLY_Pos 28U
#define HPSYS_RCC_DLL2CR_LOCK_DLY_Msk (0x7UL << HPSYS_RCC_DLL2CR_LOCK_DLY_Pos)

#define PMUC_HXT_CR1_EN          (1UL << 0)
#define PMUC_HXT_CR1_BUF_EN      (1UL << 1)
#define PMUC_HXT_CR1_BUF_DIG_EN  (1UL << 2)
#define PMUC_HXT_CR1_BUF_DLL_EN  (1UL << 5)
#define PMUC_HXT_CR1_GM_EN       (1UL << 19)
#define PMUC_PERI_LDO_EN_VDD33_LDO2 (1UL << 8)
