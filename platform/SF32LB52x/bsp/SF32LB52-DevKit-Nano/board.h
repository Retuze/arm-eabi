/**
 * @file board.h
 * @brief Board definitions for SF32LB52-DevKit-Nano (JUD6 variant).
 *
 * This header keeps board-level capabilities and the known on-board GPIO
 * mappings in one place so application code can directly test features for
 * this board instead of relying on README notes.
 */

#pragma once
#ifndef _BOARD_H_
#define _BOARD_H_

/* Known on-board display GPIOs (used by common/lcd: lcd_qspi → bit-bang bus, lcd_bus) */
#define LCD_BL 1
#define LCD_CS 3
#define LCD_RST 0
#define LCD_TE 2
#define LCD_CLK 4
#define LCD_D0 5
#define LCD_D1 6
#define LCD_D2 7
#define LCD_D3 8

/*
 * Logical panel size for lcd_panel (must match the driver linked for lcd_test in
 * project/lcd_test/CMakeLists.txt, LCD_PANEL).
 * Edit here when using panel/nv3030b_tft (e.g. 240×280); defaults match on-board CO5300 class panel.
 */
#define LCD_WIDTH 466
#define LCD_HEIGHT 466

/* Known on-board touch GPIOs */
#define CTP_INT 9
#define CTP_RST 10
#define CTP_SDA 11
#define CTP_SCL 20

/* Known on-board LEDs */
#define LED_RED 31
#define LED_GREEN 32

#endif /* _BOARD_H_ */
