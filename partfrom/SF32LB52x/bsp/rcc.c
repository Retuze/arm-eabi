#include "rcc.h"

#include "SF32LB52.h"

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
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR1.R, &hwp_hpsys_rcc->ESR1.R,
                                 &hwp_hpsys_rcc->ECR1.R, &hwp_hpsys_rcc->RSTR1.R,
                                 HPSYS_RCC_ENR1_PINMUX1};
    case SF32_RCC_MOD_SYSCFG1:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR1.R, &hwp_hpsys_rcc->ESR1.R,
                                 &hwp_hpsys_rcc->ECR1.R, &hwp_hpsys_rcc->RSTR1.R,
                                 HPSYS_RCC_ENR1_SYSCFG1};
    case SF32_RCC_MOD_GPIO1:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR2.R, &hwp_hpsys_rcc->ESR2.R,
                                 &hwp_hpsys_rcc->ECR2.R, &hwp_hpsys_rcc->RSTR2.R,
                                 HPSYS_RCC_ENR2_GPIO1};
    case SF32_RCC_MOD_GPTIM1:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR1.R, &hwp_hpsys_rcc->ESR1.R,
                                 &hwp_hpsys_rcc->ECR1.R, &hwp_hpsys_rcc->RSTR1.R,
                                 HPSYS_RCC_ENR1_GPTIM1};
    case SF32_RCC_MOD_GPTIM2:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR1.R, &hwp_hpsys_rcc->ESR1.R,
                                 &hwp_hpsys_rcc->ECR1.R, &hwp_hpsys_rcc->RSTR1.R,
                                 HPSYS_RCC_ENR1_GPTIM2};
    case SF32_RCC_MOD_BTIM1:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR1.R, &hwp_hpsys_rcc->ESR1.R,
                                 &hwp_hpsys_rcc->ECR1.R, &hwp_hpsys_rcc->RSTR1.R,
                                 HPSYS_RCC_ENR1_BTIM1};
    case SF32_RCC_MOD_BTIM2:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR1.R, &hwp_hpsys_rcc->ESR1.R,
                                 &hwp_hpsys_rcc->ECR1.R, &hwp_hpsys_rcc->RSTR1.R,
                                 HPSYS_RCC_ENR1_BTIM2};
    case SF32_RCC_MOD_SPI1:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR1.R, &hwp_hpsys_rcc->ESR1.R,
                                 &hwp_hpsys_rcc->ECR1.R, &hwp_hpsys_rcc->RSTR1.R,
                                 HPSYS_RCC_ENR1_SPI1};
    case SF32_RCC_MOD_SPI2:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR1.R, &hwp_hpsys_rcc->ESR1.R,
                                 &hwp_hpsys_rcc->ECR1.R, &hwp_hpsys_rcc->RSTR1.R,
                                 HPSYS_RCC_ENR1_SPI2};
    case SF32_RCC_MOD_I2C1:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR1.R, &hwp_hpsys_rcc->ESR1.R,
                                 &hwp_hpsys_rcc->ECR1.R, &hwp_hpsys_rcc->RSTR1.R,
                                 HPSYS_RCC_ENR1_I2C1};
    case SF32_RCC_MOD_I2C2:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR1.R, &hwp_hpsys_rcc->ESR1.R,
                                 &hwp_hpsys_rcc->ECR1.R, &hwp_hpsys_rcc->RSTR1.R,
                                 HPSYS_RCC_ENR1_I2C2};
    case SF32_RCC_MOD_I2C3:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR2.R, &hwp_hpsys_rcc->ESR2.R,
                                 &hwp_hpsys_rcc->ECR2.R, &hwp_hpsys_rcc->RSTR2.R,
                                 HPSYS_RCC_ENR2_I2C3};
    case SF32_RCC_MOD_I2C4:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR2.R, &hwp_hpsys_rcc->ESR2.R,
                                 &hwp_hpsys_rcc->ECR2.R, &hwp_hpsys_rcc->RSTR2.R,
                                 HPSYS_RCC_ENR2_I2C4};
    case SF32_RCC_MOD_USART3:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR2.R, &hwp_hpsys_rcc->ESR2.R,
                                 &hwp_hpsys_rcc->ECR2.R, &hwp_hpsys_rcc->RSTR2.R,
                                 HPSYS_RCC_ENR2_USART3};
    case SF32_RCC_MOD_MPI2:
    default:
        return (sf32_rcc_gate_t){&hwp_hpsys_rcc->ENR2.R, &hwp_hpsys_rcc->ESR2.R,
                                 &hwp_hpsys_rcc->ECR2.R, &hwp_hpsys_rcc->RSTR2.R,
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
    uint32_t width = (module == SF32_RCC_CLK_MOD_HP_PERI) ? 0x1UL : 0x3UL;
    uint32_t shift = (uint32_t)module;
    uint32_t mask = width << shift;
    uint32_t value = hwp_hpsys_rcc->CSR.R;

    value &= ~mask;
    value |= (source & width) << shift;
    hwp_hpsys_rcc->CSR.R = value;
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

    hwp_hpsys_rcc->DLL2CR.R = value;
}

void sf32_rcc_set_hclk_div(uint32_t div)
{
    if (div == 0U) {
        return;
    }

    MODIFY_REG(hwp_hpsys_rcc->CFGR.R, HPSYS_RCC_CFGR_HDIV_Msk,
               ((div - 1U) << HPSYS_RCC_CFGR_HDIV_Pos) &
                   HPSYS_RCC_CFGR_HDIV_Msk);
}
