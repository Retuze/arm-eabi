#pragma once

#include <stdint.h>

#define SF32_RCC_HCLK_HXT48_HZ 48000000UL
#define SF32_RCC_HCLK_MAX_HZ   240000000UL

/* Return codes for sf32_rcc_set_hclk_hz(). */
#define SF32_RCC_OK                     0
#define SF32_RCC_ERR_INVALID_TARGET    -1
#define SF32_RCC_ERR_DLL1_LOCK_TIMEOUT -2
#define SF32_RCC_ERR_SWITCH_VERIFY     -3
#define SF32_RCC_ERR_DVFS              -4

/*
 * Set HCLK frequency (48MHz HXT or DLL1 multiples up to 240MHz).
 * This call also reconfigures SysTick for a 1ms tick based on the new HCLK.
 */
int sf32_rcc_set_hclk_hz(uint32_t target_hz);
