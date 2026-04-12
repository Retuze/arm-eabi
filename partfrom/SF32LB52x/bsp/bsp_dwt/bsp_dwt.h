#pragma once
#ifndef _BSP_DWT_H_
#define _BSP_DWT_H_

#include <stdint.h>

int sf32_dwt_init(void);
void sf32_dwt_set_us(uint32_t us);
uint32_t sf32_dwt_get_us(void);

#endif // _BSP_DWT_H_
