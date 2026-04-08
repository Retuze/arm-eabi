#include "lcd.h"

#include "SF32LB52.h"
#include "bb_qspi.h"
#include "board.h"
#include "bsp_gpio.h"
#include "bsp_uart.h"

#include <stddef.h>
#include <stdint.h>

#define LCD_CMD_SLPOUT 0x11
#define LCD_CMD_DISPON 0x29
#define LCD_CMD_CASET  0x2A
#define LCD_CMD_RASET  0x2B
#define LCD_CMD_RAMWR  0x2C

static void lcd_write_cmd_02(uint8_t addr)
{
    /* 0x02: 1-1-1 写寄存器命令帧，随后单线发送参数。 */
    qspi_cmd_end();
    qspi_cmd_start();

    qspi_send_byte(0x02);
    qspi_send_byte(0x00);
    qspi_send_byte(addr);
    qspi_send_byte(0x00);
}

static void lcd_write_cmd_12(uint8_t addr)
{
    /* 0x12: 1-4-4 命令帧，后续像素可走 4 线数据。 */
    qspi_cmd_end();
    qspi_cmd_start();

    qspi_send_byte(0x12);
    qspi_send_byte_4wire(0x00);
    qspi_send_byte_4wire(addr);
    qspi_send_byte_4wire(0x00);
}

static void lcd_write_cmd(uint8_t cmd)
{
    lcd_write_cmd_02(cmd);
}

static void lcd_write_data(uint8_t data)
{
    qspi_send_byte(data);
}

static void lcd_read_data_03(uint8_t addr)
{
    /* 0x03: 1-1-1 读寄存器命令帧。 */
    qspi_cmd_end();
    qspi_cmd_start();

    qspi_send_byte(0x03);
    qspi_send_byte(0x00);
    qspi_send_byte(addr);
    qspi_send_byte(0x00);
}

#define lcd_qspi_cmd_param(cmd, ...) \
    do { \
        lcd_write_cmd_02(cmd); \
        uint8_t _data[] = { __VA_ARGS__ }; \
        for (size_t _i = 0U; _i < sizeof(_data) / sizeof(_data[0]); _i++) { \
            lcd_write_data(_data[_i]); \
        } \
        qspi_cmd_end(); \
    } while (0)

void lcd_reset(void)
{
    pinMode(LCD_RST, OUTPUT);

    digitalWrite(LCD_RST, HIGH);
    delay(10);
    digitalWrite(LCD_RST, LOW);
    delay(10);
    digitalWrite(LCD_RST, HIGH);
    delay(50);
}

void lcd_read_id(uint8_t id[3])
{
    if (id == NULL) {
        return;
    }

    lcd_read_data_03(0x04);
    qspi_read_data(id, 3U);
    qspi_cmd_end();
}

int lcd_init(void)
{
    uint8_t id[3] = {0U, 0U, 0U};

    qspi_init();
    lcd_reset();

    lcd_read_id(id);
    print("LCD ID: ");
    print((unsigned int)id[0]);
    print(", ");
    print((unsigned int)id[1]);
    print(", ");
    println((unsigned int)id[2]);

    delay(50);

    lcd_qspi_cmd_param(0xFE, 0x20);
    lcd_qspi_cmd_param(0xF4, 0x5A);
    lcd_qspi_cmd_param(0xF5, 0x59);

    lcd_qspi_cmd_param(0xFE, 0x20);
    lcd_qspi_cmd_param(0xF4, 0xA5);
    lcd_qspi_cmd_param(0xF5, 0xA5);

    lcd_qspi_cmd_param(0xFE, 0x00);
    lcd_qspi_cmd_param(0xC4, 0x80);
    lcd_qspi_cmd_param(0x3A, 0x55);
    lcd_qspi_cmd_param(0x35, 0x00);
    lcd_qspi_cmd_param(0x53, 0x20);
    lcd_qspi_cmd_param(0x51, 0x80);
    lcd_qspi_cmd_param(0x63, 0xFF);

    lcd_qspi_cmd_param(LCD_CMD_CASET, 0x00, 0x00, 0x01, 0x7F);
    lcd_qspi_cmd_param(LCD_CMD_RASET, 0x00, 0x00, 0x01, 0xBF);

    lcd_write_cmd(LCD_CMD_SLPOUT);
    qspi_cmd_end();
    delay(120);

    lcd_write_cmd(LCD_CMD_DISPON);
    qspi_cmd_end();

    println("LCD init done");

    return 0;
}

void lcd_set_window(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1)
{
    lcd_write_cmd(LCD_CMD_CASET);
    lcd_write_data((uint8_t)(x0 >> 8));
    lcd_write_data((uint8_t)(x0 & 0xFFU));
    lcd_write_data((uint8_t)(x1 >> 8));
    lcd_write_data((uint8_t)(x1 & 0xFFU));
    qspi_cmd_end();

    lcd_write_cmd(LCD_CMD_RASET);
    lcd_write_data((uint8_t)(y0 >> 8));
    lcd_write_data((uint8_t)(y0 & 0xFFU));
    lcd_write_data((uint8_t)(y1 >> 8));
    lcd_write_data((uint8_t)(y1 & 0xFFU));
    qspi_cmd_end();
}

void lcd_fill_color(uint16_t color)
{
    lcd_fill_rect(0U, 0U, LCD_WIDTH - 1U, LCD_HEIGHT - 1U, color);
}

void lcd_fill_rect(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t color)
{
    uint32_t pixel_count;
    uint32_t i;
    uint8_t high_byte;
    uint8_t low_byte;

    if ((x0 > x1) || (y0 > y1)) {
        return;
    }

    if (x1 >= LCD_WIDTH) {
        x1 = LCD_WIDTH - 1U;
    }

    if (y1 >= LCD_HEIGHT) {
        y1 = LCD_HEIGHT - 1U;
    }

    high_byte = (uint8_t)(color >> 8);
    low_byte = (uint8_t)(color & 0xFFU);

    lcd_set_window(x0, y0, x1, y1);

    pixel_count = (uint32_t)(x1 - x0 + 1U) * (uint32_t)(y1 - y0 + 1U);

    lcd_write_cmd_12(LCD_CMD_RAMWR);
    for (i = 0U; i < pixel_count; ++i) {
        qspi_send_byte_4wire(high_byte);
        qspi_send_byte_4wire(low_byte);
    }
    qspi_cmd_end();
}

void lcd_draw_pixel(uint16_t x, uint16_t y, uint16_t color)
{
    if ((x >= LCD_WIDTH) || (y >= LCD_HEIGHT)) {
        return;
    }

    lcd_set_window(x, y, x, y);

    lcd_write_cmd_12(LCD_CMD_RAMWR);
    qspi_send_byte_4wire((uint8_t)(color >> 8));
    qspi_send_byte_4wire((uint8_t)(color & 0xFFU));
    qspi_cmd_end();
}
