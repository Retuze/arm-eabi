#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    SF32_RCC_MOD_PINMUX1,
    SF32_RCC_MOD_SYSCFG1,
    SF32_RCC_MOD_GPIO1,
    SF32_RCC_MOD_MPI2,
} sf32_rcc_module_t;

typedef enum {
    SF32_RCC_CLK_MOD_SYS = 0,
    SF32_RCC_CLK_MOD_FLASH2 = 6,
    SF32_RCC_CLK_MOD_HP_PERI = 12,
} sf32_rcc_clock_module_t;

typedef enum {
    SF32_RCC_SYSCLK_HRC48 = 0,
    SF32_RCC_SYSCLK_HXT48 = 1,
    SF32_RCC_SYSCLK_DLL1 = 3,
    SF32_RCC_CLK_FLASH_SYSCLK = 0,
    SF32_RCC_CLK_FLASH_DLL2 = 2,
    SF32_RCC_CLK_PERI_HRC48 = 0,
    SF32_RCC_CLK_PERI_HXT48 = 1,
} sf32_rcc_clock_source_t;

void sf32_rcc_enable_module(sf32_rcc_module_t module);
void sf32_rcc_disable_module(sf32_rcc_module_t module);
void sf32_rcc_reset_module(sf32_rcc_module_t module);
void sf32_rcc_select_clock(sf32_rcc_clock_module_t module, uint32_t source);
void sf32_rcc_enable_hxt48(void);
void sf32_rcc_enable_dll2_288m(void);
void sf32_rcc_set_hclk_div(uint32_t div);

#ifdef __cplusplus
}
#endif
