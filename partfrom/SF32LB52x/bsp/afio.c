#include "afio.h"
#include "SF32LB52.h"

static volatile uint32_t *sf32_afio_pad_reg(uint32_t pad_index)
{
    if (pad_index >= HPSYS_PINMUX_PAD_COUNT) {
        return 0;
    }

    return &hwp_pinmux1->PAD[pad_index].R;
}

void sf32_afio_config_pad(uint32_t pad_index, uint32_t function_index,
                          uint32_t flags)
{
    volatile uint32_t *pad_reg = sf32_afio_pad_reg(pad_index);
    uint32_t mask = HPSYS_PINMUX_PAD_FSEL_Msk | HPSYS_PINMUX_PAD_PE_Msk |
                    HPSYS_PINMUX_PAD_PS_Msk | HPSYS_PINMUX_PAD_IE_Msk |
                    HPSYS_PINMUX_PAD_IS_Msk | HPSYS_PINMUX_PAD_SR_Msk |
                    HPSYS_PINMUX_PAD_DS0_Msk | HPSYS_PINMUX_PAD_DS1_Msk;
    uint32_t value =
        ((function_index << HPSYS_PINMUX_PAD_FSEL_Pos) &
         HPSYS_PINMUX_PAD_FSEL_Msk) |
        flags;

    if (pad_reg == 0) {
        return;
    }

    MODIFY_REG(*pad_reg, mask, value);
}

void sf32_afio_set_analog(uint32_t pad_index)
{
    volatile uint32_t *pad_reg = sf32_afio_pad_reg(pad_index);

    if (pad_reg == 0) {
        return;
    }

    MODIFY_REG(*pad_reg,
               HPSYS_PINMUX_PAD_FSEL_Msk | HPSYS_PINMUX_PAD_PE_Msk |
                   HPSYS_PINMUX_PAD_PS_Msk | HPSYS_PINMUX_PAD_IE_Msk,
               0U);
}
