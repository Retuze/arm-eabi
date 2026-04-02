#include "boot_board.h"

#include "bsp_afio.h"
#include "boot_cfg.h"
#include "bsp_rcc.h"
#include "register.h"

static void boot_flash_power_on(void)
{
    SET_BIT(PMUC->PERI_LDO, PMUC_PERI_LDO_EN_VDD33_LDO2);
}

static void boot_flash2_pinmux_init(void)
{
    sf32_afio_config_pad(BOOT_FLASH2_PAD_CLK, 1U,
                         SF32_AFIO_PULL_NONE | SF32_AFIO_DRIVE_3);
    sf32_afio_config_pad(BOOT_FLASH2_PAD_CS, 1U,
                         SF32_AFIO_PULL_NONE | SF32_AFIO_DRIVE_3);
    sf32_afio_config_pad(BOOT_FLASH2_PAD_D0, 1U,
                         SF32_AFIO_PULL_DOWN | SF32_AFIO_INPUT_ENABLE |
                             SF32_AFIO_DRIVE_3);
    sf32_afio_config_pad(BOOT_FLASH2_PAD_D1, 1U,
                         SF32_AFIO_PULL_DOWN | SF32_AFIO_INPUT_ENABLE |
                             SF32_AFIO_DRIVE_3);
    sf32_afio_config_pad(BOOT_FLASH2_PAD_D2, 1U,
                         SF32_AFIO_PULL_UP | SF32_AFIO_INPUT_ENABLE |
                             SF32_AFIO_DRIVE_3);
    sf32_afio_config_pad(BOOT_FLASH2_PAD_D3, 1U,
                         SF32_AFIO_PULL_UP | SF32_AFIO_INPUT_ENABLE |
                             SF32_AFIO_DRIVE_3);
}

static void boot_clock_init_minimal(void)
{
    sf32_rcc_enable_hxt48();
    sf32_rcc_select_clock(SF32_RCC_CLK_MOD_SYS, SF32_RCC_SYSCLK_HXT48);
    sf32_rcc_select_clock(SF32_RCC_CLK_MOD_HP_PERI, SF32_RCC_CLK_PERI_HXT48);
    sf32_rcc_enable_dll2_288m();
    sf32_rcc_select_clock(SF32_RCC_CLK_MOD_FLASH2, SF32_RCC_CLK_FLASH_DLL2);
    sf32_rcc_set_hclk_div(1U);
}

void boot_board_init(void)
{
    sf32_rcc_enable_module(SF32_RCC_MOD_SYSCFG1);
    sf32_rcc_enable_module(SF32_RCC_MOD_PINMUX1);
    sf32_rcc_enable_module(SF32_RCC_MOD_GPIO1);
    sf32_rcc_enable_module(SF32_RCC_MOD_MPI2);

    boot_flash_power_on();
    boot_flash2_pinmux_init();
    boot_clock_init_minimal();
}
