#include "lcd.h"

#include "bb_gpio.h"
#include "bsp.h"
#include "qspi/bb_qspi.h"

/* board.h (via bsp.h) may define LCD_CLK, LCD_CS, LCD_D0–LCD_D3; else leave bus inert. */
#ifndef LCD_CLK
#define LCD_CLK LCD_PIN_NONE
#endif
#ifndef LCD_CS
#define LCD_CS LCD_PIN_NONE
#endif
#ifndef LCD_D0
#define LCD_D0 LCD_PIN_NONE
#endif
#ifndef LCD_D1
#define LCD_D1 LCD_PIN_NONE
#endif
#ifndef LCD_D2
#define LCD_D2 LCD_PIN_NONE
#endif
#ifndef LCD_D3
#define LCD_D3 LCD_PIN_NONE
#endif
#ifndef LCD_RST
#define LCD_RST LCD_PIN_NONE
#endif
#ifndef LCD_TE
#define LCD_TE LCD_PIN_NONE
#endif
#ifndef LCD_BL
#define LCD_BL LCD_PIN_NONE
#endif

static const bb_qspi_bus_t lcd_bb_bus = {
    .pin_clk = LCD_CLK,
    .pin_cs  = LCD_CS,
    .pin_d0  = LCD_D0,
    .pin_d1  = LCD_D1,
    .pin_d2  = LCD_D2,
    .pin_d3  = LCD_D3,
};

static void lcd_bb_init(void)
{
    bb_qspi_init(&lcd_bb_bus);
}

static void lcd_bb_cs_low(void)
{
    bb_qspi_cs_low(&lcd_bb_bus);
}

static void lcd_bb_cs_high(void)
{
    bb_qspi_cs_high(&lcd_bb_bus);
}

static void lcd_bb_send_byte(uint8_t data)
{
    bb_qspi_send_byte(&lcd_bb_bus, data);
}

static void lcd_bb_send(const uint8_t *data, uint16_t len)
{
    bb_qspi_send(&lcd_bb_bus, data, len);
}

static void lcd_bb_send_4wire(const uint8_t *data, uint16_t len)
{
    bb_qspi_send_4wire(&lcd_bb_bus, data, len);
}

static void lcd_bb_recv(uint8_t *data, uint16_t len)
{
    bb_qspi_recv(&lcd_bb_bus, data, len);
}

const lcd_qspi_t lcd_qspi = {
    .init       = lcd_bb_init,
    .cs_low     = lcd_bb_cs_low,
    .cs_high    = lcd_bb_cs_high,
    .send_byte  = lcd_bb_send_byte,
    .send       = lcd_bb_send,
    .send_4wire = lcd_bb_send_4wire,
    .recv       = lcd_bb_recv,
};

lcd_bus_t lcd_bus = {
    .qspi      = &lcd_qspi,
    .pin_reset = LCD_RST,
    .pin_te    = LCD_TE,
    .pin_bl    = LCD_BL,
};

/* Weak so firmware without a panel driver (e.g. blink) still links; lcd_test links a strong definition. */
__attribute__((weak)) lcd_panel_t lcd_panel;

void lcd_bus_init(const lcd_bus_t *bus)
{
    const lcd_qspi_t *q = bus->qspi;

    q->init();

    if (bus->pin_reset != LCD_PIN_NONE) {
        pinMode(bus->pin_reset, OUTPUT);
        digitalWrite(bus->pin_reset, HIGH);
    }

    if (bus->pin_te != LCD_PIN_NONE) {
        pinMode(bus->pin_te, INPUT);
    }

    if (bus->pin_bl != LCD_PIN_NONE) {
        pinMode(bus->pin_bl, OUTPUT);
        digitalWrite(bus->pin_bl, LOW);
    }
}

void lcd_bus_reset(const lcd_bus_t *bus)
{
    if (bus->pin_reset == LCD_PIN_NONE) {
        return;
    }

    digitalWrite(bus->pin_reset, HIGH);
    delay(5U);
    digitalWrite(bus->pin_reset, LOW);
    delay(10U);
    digitalWrite(bus->pin_reset, HIGH);
    delay(120U);
}

void lcd_read_cmd(const lcd_bus_t *bus, uint8_t cmd, uint8_t *data, uint16_t len)
{
    const lcd_qspi_t *q = bus->qspi;

    q->cs_low();
    q->send_byte(LCD_QSPI_READ_SGL);
    q->send_byte(cmd);
    if (len > 0U && data != NULL) {
        q->recv(data, len);
    }
    q->cs_high();
}

void lcd_write_cmd(const lcd_bus_t *bus, uint8_t cmd, const uint8_t *data, uint16_t len)
{
    const lcd_qspi_t *q = bus->qspi;

    q->cs_low();
    q->send_byte(LCD_QSPI_WRITE_SGL);
    q->send_byte(cmd);
    if (len > 0U && data != NULL) {
        q->send(data, len);
    }
    q->cs_high();
}

void lcd_write_cmd4(const lcd_bus_t *bus, uint8_t cmd, const uint8_t *data, uint16_t len)
{
    const lcd_qspi_t *q = bus->qspi;

    q->cs_low();
    q->send_byte(LCD_QSPI_WRITE_Q);
    q->send_byte(cmd);
    if (len > 0U && data != NULL) {
        q->send_4wire(data, len);
    }
    q->cs_high();
}

__attribute__((weak)) void lcd_mem_write(const uint8_t *data, uint32_t len)
{
    (void)data;
    (void)len;
}

void lcd_init(void)
{
    lcd_panel_t *panel = &lcd_panel;

    lcd_bus_init(&lcd_bus);
    lcd_bus_reset(&lcd_bus);

    if (lcd_bus.pin_bl != LCD_PIN_NONE && panel->set_brightness != NULL) {
        digitalWrite(lcd_bus.pin_bl, HIGH);
    }

    if (panel->init != NULL) {
        panel->init();
    }

    if (lcd_bus.pin_bl != LCD_PIN_NONE && panel->set_brightness == NULL) {
        digitalWrite(lcd_bus.pin_bl, HIGH);
    }
}

void lcd_set_window(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1)
{
    lcd_panel_t *panel = &lcd_panel;
    if (panel->set_window != NULL) {
        panel->set_window(x0, y0, x1, y1);
    }
}

void lcd_mem_write_begin(uint16_t x, uint16_t y, uint16_t w, uint16_t h)
{
    lcd_panel_t *panel = &lcd_panel;
    if (panel->mem_write_begin != NULL) {
        panel->mem_write_begin(x, y, w, h);
    }
}

void lcd_mem_write_end(void)
{
    lcd_panel_t *panel = &lcd_panel;
    if (panel->mem_write_end != NULL) {
        panel->mem_write_end();
    }
}

void lcd_set_sleep(int sleeping)
{
    lcd_panel_t *panel = &lcd_panel;
    if (panel->set_sleep != NULL) {
        panel->set_sleep(sleeping);
    }
}

void lcd_set_brightness(uint8_t percent)
{
    lcd_panel_t *panel = &lcd_panel;
    if (panel->set_brightness != NULL) {
        if (percent > 100U) {
            percent = 100U;
        }
        panel->set_brightness(percent);
    }
}

uint32_t lcd_read_id(void)
{
    lcd_panel_t *panel = &lcd_panel;
    if (panel->read_id != NULL) {
        return panel->read_id();
    }
    return 0U;
}

void lcd_draw_pixels(uint16_t x, uint16_t y, uint16_t w, uint16_t h, const uint32_t *pixels_argb)
{
    if (pixels_argb == NULL || w == 0U || h == 0U) {
        return;
    }

    lcd_mem_write_begin(x, y, w, h);

    enum { CHUNK_PIXELS = 256U };
    const uint32_t *src  = pixels_argb;
    uint32_t        total = (uint32_t)w * (uint32_t)h;
    uint32_t        done  = 0U;

    while (done < total) {
        uint32_t n = total - done;
        if (n > CHUNK_PIXELS) {
            n = CHUNK_PIXELS;
        }
        lcd_mem_write((const uint8_t *)&src[done], n * 4U);
        done += n;
    }

    lcd_mem_write_end();
}
