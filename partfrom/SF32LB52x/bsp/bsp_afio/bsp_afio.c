#include "bsp_afio.h"
#include "SF32LB52.h"

void sf32_afio_config_pad(uint32_t pad, uint32_t fsel, uint32_t flags)
{
    uint32_t cfg;

    if (pad >= HPSYS_PINMUX_PAD_COUNT) {
        return;
    }

    cfg = flags & (SF32_AFIO_PULL_ENABLE | SF32_AFIO_PULL_SELECT_UP |
                   SF32_AFIO_INPUT_ENABLE | SF32_AFIO_INPUT_SCHMITT |
                   SF32_AFIO_SLEW_SLOW | SF32_AFIO_DRIVE_Msk);
    cfg |= (fsel << SF32_AFIO_FSEL_Pos) & SF32_AFIO_FSEL_Msk;

    HPSYS_PINMUX->PAD[pad].R = cfg;
}
