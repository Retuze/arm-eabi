#include "lcd.h"
#include "bsp.h"

/* board.h: LCD_WIDTH, LCD_HEIGHT (panel logical size). */
#ifndef LCD_WIDTH
#define LCD_WIDTH 466u
#endif
#ifndef LCD_HEIGHT
#define LCD_HEIGHT 466u
#endif

/** Bound panel bus instance for this driver (global `lcd_bus` in lcd.c). */
static lcd_bus_t *co5300_bus(void)
{
    return &lcd_bus;
}

void lcd_mem_write(const uint8_t *data, uint32_t len)
{
    const lcd_qspi_t *q = co5300_bus()->qspi;

    if (data == NULL || len == 0U) {
        return;
    }

    uint32_t rem = len;
    while (rem > 0U) {
        uint16_t chunk = (rem > 65535U) ? 65535U : (uint16_t)rem;
        q->send_4wire(data, chunk);
        data += chunk;
        rem -= (uint32_t)chunk;
    }
}

/** Single-line DCS write (0x02 framing); all panel commands go through here. */
static void co5300_dcs_write(uint8_t cmd, const uint8_t *data, uint16_t len)
{
    lcd_write_cmd(co5300_bus(), cmd, data, len);
}

static void co5300_dcs_read(uint8_t cmd, uint8_t *data, uint16_t len)
{
    lcd_read_cmd(co5300_bus(), cmd, data, len);
}

typedef struct {
    uint8_t           cmd;
    uint8_t           len;
    const uint8_t    *payload;
    uint16_t          delay_after_ms;
} co5300_init_step_t;

/** Payload blobs referenced by co5300_init_seq (ROM). */
static const uint8_t co5300_init_colmod[] = { DCS_COLMOD_ARGB8888 };

/**
 * Minimal bring-up; extend with vendor table from CO5300 datasheet.
 * Each row: DCS cmd, payload length, payload pointer (NULL if len == 0), delay after (ms).
 */
static const co5300_init_step_t co5300_init_seq[] = {
    { DCS_SET_PIXEL_FORMAT, sizeof co5300_init_colmod, co5300_init_colmod,   0U },
    { DCS_EXIT_SLEEP_MODE,  0U,                        NULL,                 120U },
    { DCS_SET_DISPLAY_ON,   0U,                        NULL,                  20U },
};

void co5300_init(void)
{
    for (size_t i = 0U; i < sizeof(co5300_init_seq) / sizeof(co5300_init_seq[0]); i++) {
        const co5300_init_step_t *s = &co5300_init_seq[i];
        co5300_dcs_write(s->cmd, (s->len > 0U) ? s->payload : NULL, s->len);
        if (s->delay_after_ms != 0U) {
            delay(s->delay_after_ms);
        }
    }
}

static void co5300_qspi_stream_start(void)
{
    const lcd_qspi_t *q = co5300_bus()->qspi;

    q->cs_low();
    q->send_byte(LCD_QSPI_WRITE_Q);
    q->send_byte(DCS_WRITE_MEMORY_START);
}

static void co5300_qspi_stream_end(void)
{
    co5300_bus()->qspi->cs_high();
}

void co5300_set_window(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1)
{
    uint8_t col[4] = {
        (uint8_t)(x0 >> 8),
        (uint8_t)(x0 & 0xFFU),
        (uint8_t)(x1 >> 8),
        (uint8_t)(x1 & 0xFFU),
    };
    uint8_t row[4] = {
        (uint8_t)(y0 >> 8),
        (uint8_t)(y0 & 0xFFU),
        (uint8_t)(y1 >> 8),
        (uint8_t)(y1 & 0xFFU),
    };

    co5300_dcs_write(DCS_SET_COLUMN_ADDRESS, col, sizeof col);
    co5300_dcs_write(DCS_SET_PAGE_ADDRESS, row, sizeof row);
}

void co5300_mem_write_begin(uint16_t x, uint16_t y, uint16_t w, uint16_t h)
{
    if (w == 0U || h == 0U) {
        return;
    }
    co5300_set_window(x, y, (uint16_t)(x + w - 1U), (uint16_t)(y + h - 1U));
    co5300_qspi_stream_start();
}

void co5300_mem_write_end(void)
{
    co5300_qspi_stream_end();
}

void co5300_set_sleep(int sleeping)
{
    if (sleeping != 0) {
        co5300_dcs_write(DCS_ENTER_SLEEP_MODE, NULL, 0U);
    } else {
        co5300_dcs_write(DCS_EXIT_SLEEP_MODE, NULL, 0U);
        delay(120U);
    }
}

void co5300_set_brightness(uint8_t percent)
{
    if (percent > 100U) {
        percent = 100U;
    }
    uint8_t level = (uint8_t)(((uint32_t)percent * 255U) / 100U);
    co5300_dcs_write(DCS_SET_DISPLAY_BRIGHTNESS, &level, 1U);
}

uint32_t co5300_read_id(void)
{
    uint8_t id[3] = {0U, 0U, 0U};
    co5300_dcs_read(DCS_GET_DISPLAY_ID, id, 3U);
    return ((uint32_t)id[0] << 16) | ((uint32_t)id[1] << 8) | (uint32_t)id[2];
}

lcd_panel_t lcd_panel = {
    .width           = (uint16_t)LCD_WIDTH,
    .height          = (uint16_t)LCD_HEIGHT,
    .init            = co5300_init,
    .set_window      = co5300_set_window,
    .mem_write_begin = co5300_mem_write_begin,
    .mem_write_end   = co5300_mem_write_end,
    .set_sleep       = co5300_set_sleep,
    .set_brightness  = co5300_set_brightness,
    .read_id         = co5300_read_id,
};
