#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define SF32_AFIO_PULL_NONE      0x00000000UL
#define SF32_AFIO_PULL_DOWN      (1UL << 4)
#define SF32_AFIO_PULL_UP        ((1UL << 4) | (1UL << 5))
#define SF32_AFIO_INPUT_ENABLE   (1UL << 6)
#define SF32_AFIO_INPUT_SCHMITT  (1UL << 7)
#define SF32_AFIO_SLEW_SLOW      (1UL << 8)
#define SF32_AFIO_DRIVE_0        0x00000000UL
#define SF32_AFIO_DRIVE_1        (1UL << 9)
#define SF32_AFIO_DRIVE_2        (1UL << 10)
#define SF32_AFIO_DRIVE_3        ((1UL << 9) | (1UL << 10))

void sf32_afio_config_pad(uint32_t pad_index, uint32_t function_index,
                          uint32_t flags);
void sf32_afio_set_analog(uint32_t pad_index);

#ifdef __cplusplus
}
#endif
