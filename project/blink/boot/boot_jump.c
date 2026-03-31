#include "boot_jump.h"

#include "boot_cfg.h"
#include "nvic.h"
#include "register.h"

static uint32_t boot_read32(uint32_t addr)
{
    return *(const volatile uint32_t *)addr;
}

int boot_app_vector_is_valid(uint32_t app_base)
{
    uint32_t sp = boot_read32(app_base);
    uint32_t pc = boot_read32(app_base + 4U);

    if (sp < SF32_SRAM_BASE || sp >= SF32_SRAM_END) {
        return 0;
    }

    if ((pc & 1U) == 0U) {
        return 0;
    }

    if (pc == 0xFFFFFFFFUL || pc == 0x00000000UL) {
        return 0;
    }

    return 1;
}

void boot_jump_to_image(uint32_t image_base)
{
    uint32_t reset = boot_read32(image_base + 4U);

    sf32_irq_disable_global();
    sf32_nvic_disable_all();
    sf32_nvic_clear_all_pending();
    sf32_nvic_set_vector_table(image_base);

    __set_MSP(boot_read32(image_base));
    __DSB();
    __ISB();

    ((void (*)(void))reset)();

    while (1) {
    }
}
