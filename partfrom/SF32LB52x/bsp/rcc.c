#include "rcc.h"

#include "register.h"

typedef struct {
    volatile uint32_t *enr;
    volatile uint32_t *esr;
    volatile uint32_t *ecr;
    volatile uint32_t *rstr;
    uint32_t mask;
} sf32_rcc_gate_t;

static sf32_rcc_gate_t sf32_rcc_resolve(sf32_rcc_module_t module)
{
    switch (module) {
    case SF32_RCC_MOD_PINMUX1:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR1, &hwp_hpsys_rcc->ESR1,
                                 &hwp_hpsys_rcc->ECR1, &hwp_hpsys_rcc->RSTR1,
                                 HPSYS_RCC_ENR1_PINMUX1};
    case SF32_RCC_MOD_SYSCFG1:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR1, &hwp_hpsys_rcc->ESR1,
                                 &hwp_hpsys_rcc->ECR1, &hwp_hpsys_rcc->RSTR1,
                                 HPSYS_RCC_ENR1_SYSCFG1};
    case SF32_RCC_MOD_GPIO1:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR2, &hwp_hpsys_rcc->ESR2,
                                 &hwp_hpsys_rcc->ECR2, &hwp_hpsys_rcc->RSTR2,
                                 HPSYS_RCC_ENR2_GPIO1};
    case SF32_RCC_MOD_MPI2:
    default:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR2, &hwp_hpsys_rcc->ESR2,
                                 &hwp_hpsys_rcc->ECR2, &hwp_hpsys_rcc->RSTR2,
                                 HPSYS_RCC_ENR2_MPI2};
    }
}

void sf32_rcc_enable_module(sf32_rcc_module_t module)
{
    sf32_rcc_gate_t gate = sf32_rcc_resolve(module);

    *gate.enr |= gate.mask;
    *gate.esr |= gate.mask;
}

void sf32_rcc_disable_module(sf32_rcc_module_t module)
{
    sf32_rcc_gate_t gate = sf32_rcc_resolve(module);

    *gate.ecr |= gate.mask;
    *gate.enr &= ~gate.mask;
}

void sf32_rcc_reset_module(sf32_rcc_module_t module)
{
    sf32_rcc_gate_t gate = sf32_rcc_resolve(module);

    *gate.rstr |= gate.mask;
    *gate.rstr &= ~gate.mask;
}

void sf32_rcc_select_clock(sf32_rcc_clock_module_t module, uint32_t source)
{
    uint32_t mask = (module == SF32_RCC_CLK_MOD_HP_PERI) ? 0x1UL : 0x3UL;
    uint32_t shift = (uint32_t)module;
    uint32_t value = hwp_hpsys_rcc->CSR;

    value &= ~(mask << shift);
    value |= (source & mask) << shift;
    hwp_hpsys_rcc->CSR = value;
}

void sf32_rcc_enable_hxt48(void)
{
    SET_BIT(hwp_pmuc->HXT_CR1, PMUC_HXT_CR1_EN | PMUC_HXT_CR1_BUF_EN |
                                   PMUC_HXT_CR1_BUF_DIG_EN |
                                   PMUC_HXT_CR1_BUF_DLL_EN | PMUC_HXT_CR1_GM_EN);
}

void sf32_rcc_enable_dll2_288m(void)
{
    uint32_t value = HPSYS_RCC_DLL2CR_EN | HPSYS_RCC_DLL2CR_SW |
                     HPSYS_RCC_DLL2CR_XTALIN_EN |
                     HPSYS_RCC_DLL2CR_OUT_DIV2_EN |
                     (6UL << HPSYS_RCC_DLL2CR_STG_Pos) |
                     (3UL << HPSYS_RCC_DLL2CR_PU_DLY_Pos) |
                     (3UL << HPSYS_RCC_DLL2CR_LOCK_DLY_Pos);

    hwp_hpsys_rcc->DLL2CR = value;
}

void sf32_rcc_set_hclk_div(uint32_t div)
{
    if (div == 0U) {
        return;
    }

    MODIFY_REG(hwp_hpsys_rcc->CFGR, HPSYS_RCC_CFGR_HDIV_Msk,
               ((div - 1U) << HPSYS_RCC_CFGR_HDIV_Pos) &
                   HPSYS_RCC_CFGR_HDIV_Msk);
}
