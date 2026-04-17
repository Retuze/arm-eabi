#include "hal_gpio.h"
#include "hal_afio.h"
#include "SF32LB52.h"

typedef struct {
    volatile uint32_t *dir;
    volatile uint32_t *dor;
    volatile uint32_t *dosr;
    volatile uint32_t *docr;
    volatile uint32_t *doer;
    volatile uint32_t *doesr;
    volatile uint32_t *doecr;
    uint32_t mask;
} gpio_bank_t;

static HPSYS_GPIO_TypeDef *gpio_hw(void)
{
    return HPSYS_GPIO;
}

static gpio_bank_t gpio_bank_select(uint32_t pin)
{
    HPSYS_GPIO_TypeDef *gpio = gpio_hw();

    if (pin < 32U) {
        return (gpio_bank_t){
            &gpio->DIR0.R,
            &gpio->DOR0.R,
            &gpio->DOSR0.R,
            &gpio->DOCR0.R,
            &gpio->DOER0.R,
            &gpio->DOESR0.R,
            &gpio->DOECR0.R,
            1UL << pin,
        };
    }

    return (gpio_bank_t){
        &gpio->DIR1.R,
        &gpio->DOR1.R,
        &gpio->DOSR1.R,
        &gpio->DOCR1.R,
        &gpio->DOER1.R,
        &gpio->DOESR1.R,
        &gpio->DOECR1.R,
        1UL << (pin - 32U),
    };
}

static uint32_t gpio_input_flags(uint8_t mode)
{
    switch (mode) {
    case INPUT_PULLUP:
        return SF32_AFIO_PULL_UP | SF32_AFIO_INPUT_ENABLE;
    case INPUT_PULLDOWN:
        return SF32_AFIO_PULL_DOWN | SF32_AFIO_INPUT_ENABLE;
    case INPUT:
    default:
        return SF32_AFIO_PULL_NONE | SF32_AFIO_INPUT_ENABLE;
    }
}

static void gpio_enable_clocks(void)
{
    const uint32_t pinmux1_mask = (1UL << 2);
    const uint32_t gpio1_mask = (1UL << 0);

    HPSYS_RCC->ENR1.R |= pinmux1_mask;
    HPSYS_RCC->ESR1.R |= pinmux1_mask;
    HPSYS_RCC->ENR2.R |= gpio1_mask;
    HPSYS_RCC->ESR2.R |= gpio1_mask;
}

void pinMode(uint32_t pin, uint8_t mode)
{
    gpio_bank_t bank = gpio_bank_select(pin);

    gpio_enable_clocks();

    if (mode == OUTPUT) {
        afio_config_pad(pin, 0U, SF32_AFIO_PULL_NONE | SF32_AFIO_DRIVE_3);
        *bank.doesr = bank.mask;
        return;
    }

    afio_config_pad(pin, 0U, gpio_input_flags(mode));
    *bank.doecr = bank.mask;
}

void digitalWrite(uint32_t pin, uint8_t value)
{
    gpio_bank_t bank = gpio_bank_select(pin);

    if (value == LOW) {
        *bank.docr = bank.mask;
    } else {
        *bank.dosr = bank.mask;
    }
}

uint8_t digitalRead(uint32_t pin)
{
    gpio_bank_t bank = gpio_bank_select(pin);
    uint32_t value;

    if ((*bank.doer & bank.mask) != 0U) {
        value = *bank.dor;
    } else {
        value = *bank.dir;
    }

    return ((value & bank.mask) != 0U) ? HIGH : LOW;
}

void digitalToggle(uint32_t pin)
{
    gpio_bank_t bank = gpio_bank_select(pin);

    if ((*bank.dor & bank.mask) != 0U) {
        *bank.docr = bank.mask;
    } else {
        *bank.dosr = bank.mask;
    }
}
