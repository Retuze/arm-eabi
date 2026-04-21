#include "lcd.h"
#include "bsp.h"

static const lcd_qspi_t *co5300_qspi(lcd_device_t *dev)
{
    return dev->bus->qspi;
}

static void *co5300_qspi_ctx(lcd_device_t *dev)
{
    return dev->bus->qspi_ctx;
}

static void co5300_mem_write(lcd_device_t *dev, const uint8_t *data, uint32_t len)
{
    const lcd_qspi_t *q = co5300_qspi(dev);
    void *ctx = co5300_qspi_ctx(dev);

    if (data == NULL || len == 0U) {
        return;
    }

    uint32_t rem = len;
    while (rem > 0U) {
        uint16_t chunk = (rem > 65535U) ? 65535U : (uint16_t)rem;
        q->send_4wire(ctx, data, chunk);
        data += chunk;
        rem -= (uint32_t)chunk;
    }
}

/** Single-line DCS write (0x02 framing); all panel commands go through here. */
static void co5300_dcs_write(lcd_device_t *dev, uint8_t cmd, const uint8_t *data, uint16_t len)
{
    lcd_write_cmd(dev, cmd, data, len);
}

static void co5300_dcs_read(lcd_device_t *dev, uint8_t cmd, uint8_t *data, uint16_t len)
{
    lcd_read_cmd(dev, cmd, data, len);
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

static int co5300_init(lcd_device_t *dev)
{
    for (size_t i = 0U; i < sizeof(co5300_init_seq) / sizeof(co5300_init_seq[0]); i++) {
        const co5300_init_step_t *s = &co5300_init_seq[i];
        co5300_dcs_write(dev, s->cmd, (s->len > 0U) ? s->payload : NULL, s->len);
        if (s->delay_after_ms != 0U) {
            delay(s->delay_after_ms);
        }
    }
    return 0;
}

static void co5300_qspi_stream_start(lcd_device_t *dev)
{
    const lcd_qspi_t *q = co5300_qspi(dev);
    void *ctx = co5300_qspi_ctx(dev);

    q->cs_low(ctx);
    q->send_byte(ctx, LCD_QSPI_WRITE_Q);
    q->send_byte(ctx, DCS_WRITE_MEMORY_START);
}

static void co5300_qspi_stream_end(lcd_device_t *dev)
{
    co5300_qspi(dev)->cs_high(co5300_qspi_ctx(dev));
}

static void co5300_set_window(lcd_device_t *dev, uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1)
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

    co5300_dcs_write(dev, DCS_SET_COLUMN_ADDRESS, col, sizeof col);
    co5300_dcs_write(dev, DCS_SET_PAGE_ADDRESS, row, sizeof row);
}

static void co5300_mem_write_begin(lcd_device_t *dev, uint16_t x, uint16_t y, uint16_t w, uint16_t h)
{
    if (w == 0U || h == 0U) {
        return;
    }
    co5300_set_window(dev, x, y, (uint16_t)(x + w - 1U), (uint16_t)(y + h - 1U));
    co5300_qspi_stream_start(dev);
}

static void co5300_mem_write_end(lcd_device_t *dev)
{
    co5300_qspi_stream_end(dev);
}

static void co5300_set_sleep(lcd_device_t *dev, int sleeping)
{
    if (sleeping != 0) {
        co5300_dcs_write(dev, DCS_ENTER_SLEEP_MODE, NULL, 0U);
    } else {
        co5300_dcs_write(dev, DCS_EXIT_SLEEP_MODE, NULL, 0U);
        delay(120U);
    }
}

static void co5300_set_brightness(lcd_device_t *dev, uint8_t percent)
{
    if (percent > 100U) {
        percent = 100U;
    }
    uint8_t level = (uint8_t)(((uint32_t)percent * 255U) / 100U);
    co5300_dcs_write(dev, DCS_SET_DISPLAY_BRIGHTNESS, &level, 1U);
}

static uint32_t co5300_read_id(lcd_device_t *dev)
{
    uint8_t id[3] = {0U, 0U, 0U};
    co5300_dcs_read(dev, DCS_GET_DISPLAY_ID, id, 3U);
    return ((uint32_t)id[0] << 16) | ((uint32_t)id[1] << 8) | (uint32_t)id[2];
}

const lcd_ic_driver_t co5300_ic_driver = {
    .name            = "co5300",
    .init            = co5300_init,
    .set_window      = co5300_set_window,
    .mem_write_begin = co5300_mem_write_begin,
    .mem_write       = co5300_mem_write,
    .mem_write_end   = co5300_mem_write_end,
    .set_sleep       = co5300_set_sleep,
    .set_brightness  = co5300_set_brightness,
    .read_id         = co5300_read_id,
};
