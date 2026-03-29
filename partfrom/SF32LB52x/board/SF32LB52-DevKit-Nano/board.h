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

/* Use -1 for documented peripherals whose exact GPIO is not yet confirmed. */
#define BOARD_PIN_UNDEF (-1)

/* Board identity */
#define BOARD_NAME "SF32LB52-DevKit-Nano"
#define BOARD_VENDOR "SiFli"
#define BOARD_SERIES "SF32LB52x"
#define BOARD_CHIP_NAME "SF32LB52JUD6"
#define BOARD_CHIP_FAMILY "SF32LB52"

/* Board package and clocks */
#define BOARD_HAS_48MHZ_XTAL 1
#define BOARD_HAS_32K_XTAL 1
#define BOARD_MAIN_XTAL_HZ 48000000U
#define BOARD_RTC_XTAL_HZ 32768U

/* Antenna */
#define BOARD_HAS_PCBA_ANTENNA 1

/* SiP / memory configuration */
#define BOARD_HAS_OPI_PSRAM 1
#define BOARD_PSRAM_SIZE_BYTES (16U * 1024U * 1024U)
#define BOARD_PSRAM_BUS_WIDTH 8U
#define BOARD_PSRAM_MAX_FREQ_HZ 144000000U

#define BOARD_HAS_QSPI_NOR_FLASH 1
#define BOARD_FLASH_SIZE_BITS (128U * 1024U * 1024U)
#define BOARD_FLASH_SIZE_BYTES (16U * 1024U * 1024U)
#define BOARD_FLASH_MAX_FREQ_HZ 72000000U
#define BOARD_FLASH_STR_MODE 1
#define BOARD_FLASH_DDR_MODE 0

/* Exposed board resources from the product page */
#define BOARD_LCC_GPIO_COUNT 17U
#define BOARD_LGA_GPIO_COUNT 13U
#define BOARD_GPIO_COUNT_TOTAL (BOARD_LCC_GPIO_COUNT + BOARD_LGA_GPIO_COUNT)

#define BOARD_UART_COUNT 3U
#define BOARD_I2C_COUNT 4U
#define BOARD_GPTIM_COUNT 2U
#define BOARD_SPI_COUNT 2U
#define BOARD_GPADC_COUNT 3U

#define BOARD_GPIO_SUPPORTS_UART_MUX 1
#define BOARD_GPIO_SUPPORTS_I2C_MUX 1
#define BOARD_GPIO_SUPPORTS_GPTIM_MUX 1

/* Display and touch */
#define BOARD_HAS_DISPLAY_FPC_16P 1
#define BOARD_DISPLAY_FPC_PIN_COUNT 16U
#define BOARD_DISPLAY_FPC_PITCH_MM 0.5f
#define BOARD_DISPLAY_SUPPORTS_SPI 1
#define BOARD_DISPLAY_SUPPORTS_DSPI 1
#define BOARD_DISPLAY_SUPPORTS_QSPI 1
#define BOARD_DISPLAY_SUPPORTS_QSPI_DDR 1
#define BOARD_HAS_TOUCH_I2C 1
#define BOARD_SUPPORTS_AMOLED_1P85_HUANGSHANPI 1

/* Audio */
#define BOARD_HAS_AUDIO_ADC_INPUT 1
#define BOARD_HAS_ANALOG_MIC_INPUT 1
#define BOARD_HAS_DIGITAL_MIC_INPUT 1
#define BOARD_HAS_PDM_MIC_INPUT 1
#define BOARD_HAS_ANALOG_AUDIO_OUTPUT 1
#define BOARD_AUDIO_OUTPUT_NEEDS_EXTERNAL_PA 1

/* USB / debug */
#define BOARD_HAS_USB_TYPEC_UART 1
#define BOARD_HAS_CH340N 1
#define BOARD_HAS_USB2_FS 1
#define BOARD_USB2_FS_EXPOSED_ON_LCC 1
#define BOARD_CH340N_SUPPORTS_DOWNLOAD 1
#define BOARD_CH340N_SUPPORTS_DEBUG 1
#define BOARD_CH340N_CAN_POWER_BOARD 1

/* Power */
#define BOARD_HAS_VBUS_5V_TO_3V3_LDO 1
#define BOARD_HAS_POWER_SWITCH 1
#define BOARD_POWER_INPUT_IS_USB_TYPEC 1
#define BOARD_POWER_SWITCH_CTRL_FROM_CH340N_RTS_N 1
#define BOARD_POWER_SWITCH_RTS_ACTIVE_LOW 1
#define BOARD_CH340N_RTS_CAN_RESET_MCU 1

/* Buttons and LEDs */
#define BOARD_BUTTON_COUNT 2U
#define BOARD_HAS_FUNCTION_BUTTON 1
#define BOARD_HAS_POWER_BUTTON 1
#define BOARD_POWER_BUTTON_SUPPORTS_10S_RESET 1

#define BOARD_LED_COUNT 2U
#define BOARD_LED_ACTIVE_LEVEL 1

/*
 * The product page confirms these buttons exist, but the exact GPIOs are not
 * identified in the current local board files.
 */
#define BOARD_FUNCTION_BUTTON_PIN BOARD_PIN_UNDEF
#define BOARD_POWER_BUTTON_PIN BOARD_PIN_UNDEF
#define BOARD_CH340N_RTS_N_PIN BOARD_PIN_UNDEF

/* Known on-board display GPIOs */
#define LCD_BL 1
#define LCD_CS 3
#define LCD_RST 0
#define LCD_TE 2
#define LCD_CLK 4
#define LCD_D0 5
#define LCD_D1 6
#define LCD_D2 7
#define LCD_D3 8

#define BOARD_LCD_BACKLIGHT_PIN LCD_BL
#define BOARD_LCD_CS_PIN LCD_CS
#define BOARD_LCD_RESET_PIN LCD_RST
#define BOARD_LCD_TE_PIN LCD_TE
#define BOARD_LCD_CLK_PIN LCD_CLK
#define BOARD_LCD_DATA0_PIN LCD_D0
#define BOARD_LCD_DATA1_PIN LCD_D1
#define BOARD_LCD_DATA2_PIN LCD_D2
#define BOARD_LCD_DATA3_PIN LCD_D3

/* Known on-board touch GPIOs */
#define CTP_INT 9
#define CTP_RST 10
#define CTP_SDA 11
#define CTP_SCL 20

#define BOARD_TOUCH_INT_PIN CTP_INT
#define BOARD_TOUCH_RESET_PIN CTP_RST
#define BOARD_TOUCH_SDA_PIN CTP_SDA
#define BOARD_TOUCH_SCL_PIN CTP_SCL

/* Known on-board LEDs */
#define LED_RED 31
#define LED_GREEN 32
#define LED0 LED_RED
#define LED1 LED_GREEN

#define BOARD_LED_RED_PIN LED_RED
#define BOARD_LED_GREEN_PIN LED_GREEN
#define BOARD_STATUS_LED_PIN LED0
#define BOARD_USER_LED_PIN LED1

#endif /* _BOARD_H_ */
