#include "gptim.h"

#include "rcc.h"

static void sf32_gptim_enable_clock(GPTIM_TypeDef *timer)
{
    if (timer == GPTIM1) {
        sf32_rcc_enable_module(SF32_RCC_MOD_GPTIM1);
    } else if (timer == GPTIM2) {
        sf32_rcc_enable_module(SF32_RCC_MOD_GPTIM2);
    }
}

void sf32_gptim_init(GPTIM_TypeDef *timer, const sf32_gptim_init_t *init)
{
    uint32_t cr1 = GPTIM_CR1_ARPE;

    if ((timer == 0) || (init == 0)) {
        return;
    }

    sf32_gptim_enable_clock(timer);

    if (init->direction == SF32_GPTIM_COUNT_DOWN) {
        cr1 |= GPTIM_CR1_DIR;
    }

    timer->CR1 = 0U;
    timer->DIER = 0U;
    timer->CCER = 0U;
    timer->PSC = init->prescaler;
    timer->ARR = init->period;
    timer->CNT = 0U;
    timer->EGR = GPTIM_EGR_UG;
    timer->SR = 0U;
    timer->CR1 = cr1;
}

void sf32_gptim_start(GPTIM_TypeDef *timer)
{
    if (timer == 0) {
        return;
    }

    SET_BIT(timer->CR1, GPTIM_CR1_CEN);
}

void sf32_gptim_stop(GPTIM_TypeDef *timer)
{
    if (timer == 0) {
        return;
    }

    CLEAR_BIT(timer->CR1, GPTIM_CR1_CEN);
}

uint16_t sf32_gptim_get_count(GPTIM_TypeDef *timer)
{
    if (timer == 0) {
        return 0U;
    }

    return (uint16_t)(timer->CNT & 0xFFFFU);
}

void sf32_gptim_set_count(GPTIM_TypeDef *timer, uint16_t value)
{
    if (timer == 0) {
        return;
    }

    timer->CNT = value;
}

void sf32_gptim_pwm_ch1_init(GPTIM_TypeDef *timer, uint16_t pulse,
                             uint8_t active_low)
{
    uint32_t ccmr1;
    uint32_t ccer = GPTIM_CCER_CC1E;

    if (timer == 0) {
        return;
    }

    ccmr1 = timer->CCMR1;
    ccmr1 &= ~(GPTIM_CCMR_OC1M_Msk | GPTIM_CCMR_OC1PE);
    ccmr1 |= GPTIM_CCMR_OC1PE;
    ccmr1 |= active_low ? GPTIM_OC_MODE_PWM2 : GPTIM_OC_MODE_PWM1;

    if (active_low != 0U) {
        ccer |= GPTIM_CCER_CC1P;
    }

    timer->CCR1 = pulse;
    timer->CCMR1 = ccmr1;
    timer->CCER = ccer;
    timer->EGR = GPTIM_EGR_UG;
}
