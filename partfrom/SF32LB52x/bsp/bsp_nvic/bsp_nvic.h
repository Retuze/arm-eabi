#pragma once

#include <stdint.h>

#define SYST_CSR_ENABLE     (1UL << 0)
#define SYST_CSR_TICKINT    (1UL << 1)
#define SYST_CSR_CLKSOURCE  (1UL << 2)

void sf32_nvic_disable_all(void);
void sf32_nvic_clear_all_pending(void);
void sf32_nvic_set_vector_table(uint32_t vector_base);
void sf32_irq_disable_global(void);
void sf32_irq_enable_global(void);
