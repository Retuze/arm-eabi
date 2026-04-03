#pragma once
#ifndef _BSP_DWT_H_
#define _BSP_DWT_H_

#include <stdint.h>

int sf32_dwt_init(void);
void sf32_dwt_reset_cycle(void);
uint32_t sf32_dwt_get_cycle(void);

#endif // _BSP_DWT_H_
