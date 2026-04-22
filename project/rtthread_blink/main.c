#include <rtthread.h>

#include "bsp.h"

typedef struct {
    uint32_t pin;
    rt_uint32_t interval_ms;
    const char *name;
} led_thread_cfg_t;

static led_thread_cfg_t red_led = {
    .pin = LED_RED,
    .interval_ms = 500,
    .name = "red",
};

static led_thread_cfg_t green_led = {
    .pin = LED_GREEN,
    .interval_ms = 250,
    .name = "green",
};

static struct rt_thread red_thread;
static struct rt_thread green_thread;
static rt_uint8_t red_thread_stack[1024];
static rt_uint8_t green_thread_stack[1024];

static void led_thread_entry(void *parameter)
{
    const led_thread_cfg_t *cfg = (const led_thread_cfg_t *)parameter;

    pinMode(cfg->pin, OUTPUT);
    rt_kprintf("%s led thread start\n", cfg->name);

    while (1) {
        digitalWrite(cfg->pin, HIGH);
        rt_thread_mdelay(cfg->interval_ms);
        digitalWrite(cfg->pin, LOW);
        rt_thread_mdelay(cfg->interval_ms);
    }
}

int main(void)
{
    rt_err_t result;

    rt_kprintf("RT-Thread dual blink start\n");

    result = rt_thread_init(&red_thread, "led_r", led_thread_entry, &red_led,
                            red_thread_stack, sizeof(red_thread_stack), 10, 10);
    if (result != RT_EOK) {
        rt_kprintf("red led thread init failed: %d\n", result);
        return -1;
    }
    rt_thread_startup(&red_thread);

    result = rt_thread_init(&green_thread, "led_g", led_thread_entry, &green_led,
                            green_thread_stack, sizeof(green_thread_stack), 11, 10);
    if (result != RT_EOK) {
        rt_kprintf("green led thread init failed: %d\n", result);
        return -1;
    }
    rt_thread_startup(&green_thread);

    return 0;
}
