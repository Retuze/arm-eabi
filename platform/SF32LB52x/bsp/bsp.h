#pragma once
#ifndef BSP_H
#define BSP_H

#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

/* SoC */
#include "SF32LB52.h"

/* HAL */
#include "hal_afio.h"
#include "hal_gpio.h"
#include "hal_pwm.h"
#include "hal_uart.h"

/* LL */
#include "ll_dwt.h"
#include "ll_nvic.h"
#include "ll_rcc.h"
#include "ll_rtt.h"

/* Board */
#include "board.h"

/* Provided by each project's system.c */
void SystemInit(void);
uint32_t millis(void);
void delay(uint32_t ms);

#endif
