#pragma once

#include <stdint.h>

#include "SF32LB52.h"

#ifdef __cplusplus
extern "C" {
#endif

#define SF32_GPTIM_COUNT_UP    0U
#define SF32_GPTIM_COUNT_DOWN  1U

typedef struct {
    uint16_t prescaler;
    uint16_t period;
    uint8_t direction;
} sf32_gptim_init_t;

void sf32_gptim_init(GPTIM_TypeDef *timer, const sf32_gptim_init_t *init);
void sf32_gptim_start(GPTIM_TypeDef *timer);
void sf32_gptim_stop(GPTIM_TypeDef *timer);
uint16_t sf32_gptim_get_count(GPTIM_TypeDef *timer);
void sf32_gptim_set_count(GPTIM_TypeDef *timer, uint16_t value);
void sf32_gptim_pwm_ch1_init(GPTIM_TypeDef *timer, uint16_t pulse,
                             uint8_t active_low);

#ifdef __cplusplus
}
#endif
