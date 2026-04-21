#include "board.h"

#include "bus/lcd_qspi_bitbang.h"
#include "lcd.h"

extern const lcd_ic_driver_t co5300_ic_driver;

static lcd_qspi_bitbang_t lcd0_qspi = {
    .pin_clk = LCD_CLK,
    .pin_cs  = LCD_CS,
    .pin_d0  = LCD_D0,
    .pin_d1  = LCD_D1,
    .pin_d2  = LCD_D2,
    .pin_d3  = LCD_D3,
};

static lcd_bus_t lcd0_bus = {
    .qspi     = &lcd_qspi_bitbang_ops,
    .qspi_ctx = &lcd0_qspi,
};

lcd_device_t lcd0 = {
    .name      = "lcd0",
    .bus       = &lcd0_bus,
    .ic        = &co5300_ic_driver,
    .width     = (uint16_t)LCD_WIDTH,
    .height    = (uint16_t)LCD_HEIGHT,
    .pin_reset = LCD_RST,
    .pin_te    = LCD_TE,
    .pin_bl    = LCD_BL,
};
