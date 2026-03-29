#include "gpio.h"
#include "SF32LB52_registers.h"

typedef struct {
    volatile SF32_REG32 *input;
    volatile SF32_REG32 *output;
    volatile SF32_REG32 *output_set;
    volatile SF32_REG32 *output_clear;
    volatile SF32_REG32 *output_enable;
    volatile SF32_REG32 *output_enable_set;
    volatile SF32_REG32 *output_enable_clear;
    uint32_t mask;
} gpio_bank_t;

static int gpio_bank_select(uint8_t pin, gpio_bank_t *bank)
{
    if (pin <= 31U) {
        bank->input = &HPSYS_GPIO->DIR0;
        bank->output = &HPSYS_GPIO->DOR0;
        bank->output_set = &HPSYS_GPIO->DOSR0;
        bank->output_clear = &HPSYS_GPIO->DOCR0;
        bank->output_enable = &HPSYS_GPIO->DOER0;
        bank->output_enable_set = &HPSYS_GPIO->DOESR0;
        bank->output_enable_clear = &HPSYS_GPIO->DOECR0;
        bank->mask = (1UL << pin);
        return 0;
    }

    if (pin <= 44U) {
        uint8_t pin_bank1 = (uint8_t)(pin - 32U);
        bank->input = &HPSYS_GPIO->DIR1;
        bank->output = &HPSYS_GPIO->DOR1;
        bank->output_set = &HPSYS_GPIO->DOSR1;
        bank->output_clear = &HPSYS_GPIO->DOCR1;
        bank->output_enable = &HPSYS_GPIO->DOER1;
        bank->output_enable_set = &HPSYS_GPIO->DOESR1;
        bank->output_enable_clear = &HPSYS_GPIO->DOECR1;
        bank->mask = (1UL << pin_bank1);
        return 0;
    }

    return -1;
}

void pinMode(uint8_t pin, uint8_t mode)
{
    gpio_bank_t bank;

    if (gpio_bank_select(pin, &bank) != 0) {
        return;
    }

    HPSYS_RCC->ENR1.R |= (1UL << 0);
    HPSYS_RCC->ESR1.R |= (1UL << 0);

    switch (mode) {
    case INPUT:
    case INPUT_PULLUP:
    case INPUT_PULLDOWN:
        bank.output_enable_clear->R |= bank.mask;
        break;
    case OUTPUT:
        bank.output_enable_set->R |= bank.mask;
        break;
    default:
        break;
    }
}

void digitalWrite(uint8_t pin, uint8_t value)
{
    gpio_bank_t bank;

    if (gpio_bank_select(pin, &bank) != 0) {
        return;
    }

    if (value == HIGH) {
        bank.output_set->R |= bank.mask;
    } else {
        bank.output_clear->R |= bank.mask;
    }
}

uint8_t digitalRead(uint8_t pin)
{
    gpio_bank_t bank;
    uint32_t value;

    if (gpio_bank_select(pin, &bank) != 0) {
        return LOW;
    }

    if ((bank.output_enable->R & bank.mask) != 0U) {
        value = bank.output->R;
    } else {
        value = bank.input->R;
    }

    return ((value & bank.mask) != 0U) ? HIGH : LOW;
}

void digitalToggle(uint8_t pin)
{
    gpio_bank_t bank;

    if (gpio_bank_select(pin, &bank) != 0) {
        return;
    }

    digitalWrite(pin, (bank.output->R & bank.mask) != 0U ? LOW : HIGH);
}

uint32_t millis(void)
{
    extern uint32_t tick_get(void);
    return tick_get();
}

void delay(uint32_t ms)
{
    uint32_t start = millis();
    while ((millis() - start) < ms) {
    }
}
