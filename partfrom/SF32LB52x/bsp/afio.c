#include "afio.h"

#include "register.h"

static volatile uint32_t *sf32_afio_pad_reg(uint32_t pad_index)
{
    return &((&hwp_pinmux1->PAD_SA00)[pad_index]);
}

void sf32_afio_config_pad(uint32_t pad_index, uint32_t function_index,
                          uint32_t flags)
{
    volatile uint32_t *pad_reg = sf32_afio_pad_reg(pad_index);
    uint32_t mask = HPSYS_PINMUX_PAD_SA00_FSEL_Msk |
                    HPSYS_PINMUX_PAD_SA00_PE_Msk |
                    HPSYS_PINMUX_PAD_SA00_PS_Msk |
                    HPSYS_PINMUX_PAD_SA00_IE_Msk |
                    HPSYS_PINMUX_PAD_SA00_IS_Msk |
                    HPSYS_PINMUX_PAD_SA00_SR_Msk |
                    HPSYS_PINMUX_PAD_SA00_DS0_Msk |
                    HPSYS_PINMUX_PAD_SA00_DS1_Msk;
    uint32_t value =
        ((function_index << HPSYS_PINMUX_PAD_SA00_FSEL_Pos) &
         HPSYS_PINMUX_PAD_SA00_FSEL_Msk) |
        flags;

    MODIFY_REG(*pad_reg, mask, value);
}

void sf32_afio_set_analog(uint32_t pad_index)
{
    volatile uint32_t *pad_reg = sf32_afio_pad_reg(pad_index);

    MODIFY_REG(*pad_reg,
               HPSYS_PINMUX_PAD_SA00_FSEL_Msk | HPSYS_PINMUX_PAD_SA00_PE_Msk |
                   HPSYS_PINMUX_PAD_SA00_PS_Msk | HPSYS_PINMUX_PAD_SA00_IE_Msk,
               0U);
}
