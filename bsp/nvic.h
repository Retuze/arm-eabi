#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

void sf32_nvic_disable_all(void);
void sf32_nvic_clear_all_pending(void);
void sf32_nvic_set_vector_table(uint32_t vector_base);
void sf32_irq_disable_global(void);
void sf32_irq_enable_global(void);

#ifdef __cplusplus
}
#endif
