#include "bsp_gpio.h"
#include "bsp_dwt.h"
#include "bsp_rcc.h"
#include "bsp_uart.h"
#include "SF32LB52.h"

#define sf32_log print

static void sf32_log_u32(const char *prefix, uint32_t value, const char *suffix)
{
    char buf[11];
    int i = 0;

    if (prefix != 0) {
        sf32_log(prefix);
    }

    if (value == 0U) {
        sf32_log("0");
    } else {
        while ((value > 0U) && (i < (int)sizeof(buf))) {
            buf[i++] = (char)('0' + (value % 10U));
            value /= 10U;
        }
        while (i > 0) {
            --i;
            char out[2];
            out[0] = buf[i];
            out[1] = '\0';
            sf32_log(out);
        }
    }

    if (suffix != 0) {
        sf32_log(suffix);
    }
}

static void sf32_log_i32(const char *prefix, int32_t value, const char *suffix)
{
    if (value < 0) {
        sf32_log(prefix);
        sf32_log("-");
        sf32_log_u32(0, (uint32_t)(-value), suffix);
        return;
    }

    sf32_log_u32(prefix, (uint32_t)value, suffix);
}

static const char *sf32_clock_rc_text(int rc)
{
    switch (rc) {
    case SF32_RCC_OK:
        return "ok";
    case SF32_RCC_ERR_INVALID_TARGET:
        return "invalid target";
    case SF32_RCC_ERR_DLL1_LOCK_TIMEOUT:
        return "dll1 lock timeout";
    case SF32_RCC_ERR_SWITCH_VERIFY:
        return "switch verify failed";
    case SF32_RCC_ERR_DVFS:
        return "dvfs config failed";
    default:
        return "unknown";
    }
}

int main(void)
{
    const uint32_t target_hclk_hz = 240000000UL;
    int rc;
    pinMode(31, OUTPUT);

    sf32_log("blink start\n");
    rc = sf32_rcc_set_hclk_hz(target_hclk_hz);
    sf32_log_i32("set 240MHz rc=", rc, ", ");
    sf32_log(sf32_clock_rc_text(rc));
    sf32_log("\n");

    while (1) {
        digitalToggle(31);
        delay(500);
    }
}
