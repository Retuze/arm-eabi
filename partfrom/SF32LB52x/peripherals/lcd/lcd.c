#include "lcd.h"
#include "bb_qspi.h"
#include "bsp_gpio.h"
#include "board.h"
#include <stddef.h>
#include <stdint.h>

/* LCD命令定义 */
#define LCD_CMD_NOP         0x00
#define LCD_CMD_SWRESET     0x01
#define LCD_CMD_RDDID       0x04
#define LCD_CMD_SLPIN       0x10
#define LCD_CMD_SLPOUT      0x11
#define LCD_CMD_INVOFF      0x20
#define LCD_CMD_INVON       0x21
#define LCD_CMD_DISPOFF     0x28
#define LCD_CMD_DISPON      0x29
#define LCD_CMD_CASET       0x2A
#define LCD_CMD_RASET       0x2B
#define LCD_CMD_RAMWR       0x2C
#define LCD_CMD_RAMRD       0x2E
#define LCD_CMD_COLMOD      0x3A
#define LCD_CMD_MADCTL      0x36

/**
 * @brief 发送LCD命令
 */
static void lcd_write_cmd_02(uint8_t addr)
{
    /* 先拉高CS，确保上个命令结束 */
    qspi_cmd_end();
    /* 拉低CS，选中设备 */
    qspi_cmd_start();
    
    qspi_send_byte(0x02);      /* QSPI命令0x02 */
    qspi_send_byte(0x00);      /* 地址高字节 */
    qspi_send_byte(addr);      /* 地址中字节 */
    qspi_send_byte(0x00);      /* 地址低字节 */
}

/**
 * @brief 发送LCD命令
 */
static void lcd_write_cmd_12(uint8_t addr)
{
    /* 先拉高CS，确保上个命令结束 */
    qspi_cmd_end();
    /* 拉低CS，选中设备 */
    qspi_cmd_start();
    
    qspi_send_byte(0x12);           /* QSPI命令0x12 */
    qspi_send_byte_4wire(0x00);     /* 地址高字节，4线发送 */
    qspi_send_byte_4wire(addr);     /* 地址中字节，4线发送 */
    qspi_send_byte_4wire(0x00);     /* 地址低字节，4线发送 */
}

static void lcd_write_cmd(uint8_t cmd)
{
    lcd_write_cmd_02(cmd);
}

/**
 * @brief 发送LCD数据
 */
static void lcd_write_data(uint8_t data)
{
    qspi_send_byte(data);
}

/**
 * @brief 读取LCD数据
 */
static void lcd_read_data_03(uint8_t addr)
{
    /* 先拉高CS，确保上个命令结束 */
    qspi_cmd_end();
    /* 拉低CS，选中设备 */
    qspi_cmd_start();
    
    qspi_send_byte(0x03);      /* QSPI命令0x03 */
    qspi_send_byte(0x00);      /* 地址高字节 */
    qspi_send_byte(addr);      /* 地址中字节 */
    qspi_send_byte(0x00);      /* 地址低字节 */
}


#define lcd_qspi_cmd_param(cmd, ...) \
    do { \
        lcd_write_cmd_02(cmd); \
        uint8_t _data[] = { __VA_ARGS__ }; \
        for (size_t _i = 0; _i < sizeof(_data) / sizeof(_data[0]); _i++) { \
            lcd_write_data(_data[_i]); \
        } \
    } while(0)

/**
 * @brief LCD硬件复位
 */
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

/**
 * @brief 初始化LCD屏幕
 */
void lcd_init(void)
{
    uint8_t id[3];
    
    /* 初始化QSPI GPIO */
    qspi_init();
    
    /* 硬件复位 */
    lcd_reset();
    
    /* 读取并验证LCD ID */
    lcd_read_id_04(id);
    
    printf("LCD ID: 0x%02X 0x%02X 0x%02X\n", id[0], id[1], id[2]);
    
    delay(50);
    
    /* 密码解锁序列 */
    lcd_qspi_cmd_param(0xFE, 0x20);
    lcd_qspi_cmd_param(0xF4, 0x5A);
    lcd_qspi_cmd_param(0xF5, 0x59);
    
    lcd_qspi_cmd_param(0xFE, 0x20);
    lcd_qspi_cmd_param(0xF4, 0xA5);
    lcd_qspi_cmd_param(0xF5, 0xA5);
    
    /* 基本配置 */
    lcd_qspi_cmd_param(0xFE, 0x00);
    lcd_qspi_cmd_param(0xC4, 0x80);
    lcd_qspi_cmd_param(0x3A, 0x55);  /* RGB565 */
    lcd_qspi_cmd_param(0x35, 0x00);
    lcd_qspi_cmd_param(0x53, 0x20);
    lcd_qspi_cmd_param(0x51, 0x80);
    lcd_qspi_cmd_param(0x63, 0xFF);
    
    /* 设置窗口 */
    lcd_qspi_cmd_param(0x2A, 0x00, 0x00, 0x01, 0x7F);
    lcd_qspi_cmd_param(0x2B, 0x00, 0x00, 0x01, 0xBF);
    
    /* 退出睡眠模式 */
    lcd_write_cmd(0x11);
    qspi_gpio_cmd_end();
    delay(120);
    
    /* 显示开 */
    lcd_write_cmd(0x29);
    qspi_gpio_cmd_end();
    
    printf("LCD initialization completed!\n");
}

/**
 * @brief 设置LCD显示窗口
 */
void lcd_set_window(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1)
{
    lcd_write_cmd(LCD_CMD_CASET);
    lcd_write_data((x0 >> 8) & 0xFF);
    lcd_write_data(x0 & 0xFF);
    lcd_write_data((x1 >> 8) & 0xFF);
    lcd_write_data(x1 & 0xFF);
    qspi_gpio_cmd_end();
    
    lcd_write_cmd(LCD_CMD_RASET);
    lcd_write_data((y0 >> 8) & 0xFF);
    lcd_write_data(y0 & 0xFF);
    lcd_write_data((y1 >> 8) & 0xFF);
    lcd_write_data(y1 & 0xFF);
    qspi_gpio_cmd_end();
}

/**
 * @brief 填充指定颜色
 */
void lcd_fill_color(uint16_t color)
{
    lcd_fill_rect(0, 0, LCD_WIDTH - 1, LCD_HEIGHT - 1, color);
}

/**
 * @brief 填充指定区域
 */
void lcd_fill_rect(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint16_t color)
{
    uint32_t pixel_count;
    uint32_t i;
    uint8_t high_byte = (uint8_t)((color >> 8) & 0xFFU);
    uint8_t low_byte  = (uint8_t)(color & 0xFFU);
    
    /* 参数检查 */
    if (x0 > x1 || y0 > y1) {
        return;
    }
    if (x1 >= LCD_WIDTH) x1 = LCD_WIDTH - 1;
    if (y1 >= LCD_HEIGHT) y1 = LCD_HEIGHT - 1;
    
    /* 设置窗口 */
    lcd_set_window(x0, y0, x1, y1);
    
    /* 计算像素数量 */
    pixel_count = (uint32_t)(x1 - x0 + 1) * (uint32_t)(y1 - y0 + 1);
    
    /* 发送像素数据 */
    qspi_gpio_cmd12(LCD_CMD_RAMWR);
    
    for (i = 0U; i < pixel_count; i++) {
        qspi_gpio_send_byte_4wire(high_byte);
        qspi_gpio_send_byte_4wire(low_byte);
    }
    
    qspi_gpio_cmd_end();
}

/**
 * @brief 绘制一个像素点
 */
void lcd_draw_pixel(uint16_t x, uint16_t y, uint16_t color)
{
    uint8_t data[2];
    
    /* 参数检查 */
    if (x >= LCD_WIDTH || y >= LCD_HEIGHT) {
        return;
    }
    
    /* 设置窗口为单个像素 */
    lcd_set_window(x, y, x, y);
    
    /* 准备颜色数据 */
    data[0] = (color >> 8) & 0xFF;
    data[1] = color & 0xFF;
    
    /* 发送像素数据 */
    qspi_gpio_cmd02(0x00);
    qspi_gpio_send_byte(LCD_CMD_RAMWR);
    qspi_gpio_send_data(data, 2);
    qspi_gpio_cmd_end();
}
