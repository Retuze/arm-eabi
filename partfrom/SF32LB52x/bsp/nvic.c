#include "nvic.h"

#include "register.h"

static uint32_t sf32_nvic_group_count(void)
{
    return (SCnSCB->ICTR & 0xFUL) + 1U;
}

void sf32_nvic_disable_all(void)
{
    uint32_t groups = sf32_nvic_group_count();

    for (uint32_t i = 0; i < groups; ++i) {
        NVIC->ICER[i] = 0xFFFFFFFFUL;
    }
}

void sf32_nvic_clear_all_pending(void)
{
    uint32_t groups = sf32_nvic_group_count();

    for (uint32_t i = 0; i < groups; ++i) {
        NVIC->ICPR[i] = 0xFFFFFFFFUL;
    }
}

void sf32_nvic_set_vector_table(uint32_t vector_base)
{
    SCB->VTOR = vector_base;
    __DSB();
    __ISB();
}

void sf32_irq_disable_global(void)
{
    __disable_irq();
}

void sf32_irq_enable_global(void)
{
    __enable_irq();
}
