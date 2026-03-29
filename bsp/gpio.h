
#ifndef __GPIO_H__
#define __GPIO_H__

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/* GPIO 引脚模式定义 */
#define INPUT           0x00    /* 输入模式 */
#define OUTPUT          0x01    /* 输出模式 */
#define INPUT_PULLUP    0x02    /* 输入模式，内部上拉 */
#define INPUT_PULLDOWN  0x03    /* 输入模式，内部下拉 */

/* GPIO 电平定义 */
#define LOW             0x00    /* 低电平 */
#define HIGH            0x01    /* 高电平 */

/**
 * @brief 配置GPIO引脚模式
 * @param pin 引脚编号（具体含义由各平台board.h定义）
 * @param mode 引脚模式 (INPUT, OUTPUT, INPUT_PULLUP, INPUT_PULLDOWN)
 * 
 * @note 此函数会自动使能对应的GPIO时钟
 * 
 * @example
 *   pinMode(LED_RED, OUTPUT);
 *   pinMode(BUTTON, INPUT_PULLUP);
 */
void pinMode(uint8_t pin, uint8_t mode);

/**
 * @brief 写GPIO引脚电平
 * @param pin 引脚编号
 * @param value 电平值 (LOW=0, HIGH=1)
 * 
 * @note 引脚必须配置为OUTPUT模式
 * 
 * @example
 *   digitalWrite(LED_RED, HIGH);
 *   digitalWrite(LED_RED, LOW);
 */
void digitalWrite(uint8_t pin, uint8_t value);

/**
 * @brief 读GPIO引脚电平
 * @param pin 引脚编号
 * @return 引脚电平值 (LOW=0, HIGH=1)
 * 
 * @note 引脚必须配置为INPUT或INPUT_PULLUP/INPUT_PULLDOWN模式
 * 
 * @example
 *   uint8_t value = digitalRead(BUTTON);
 */
uint8_t digitalRead(uint8_t pin);

/**
 * @brief 翻转GPIO引脚电平
 * @param pin 引脚编号
 * 
 * @note 引脚必须配置为OUTPUT模式
 * 
 * @example
 *   digitalToggle(LED_RED);
 */
void digitalToggle(uint8_t pin);

/**
 * @brief 获取系统运行时间，单位为毫秒
 * @return 系统启动后的毫秒数
 * 
 * @note 依赖于系统定时器实现
 * 
 * @example
 *   uint32_t t = millis();
 */
uint32_t millis(void);

/**
 * @brief 延时函数，阻塞指定毫秒数
 * @param ms 延时时间，单位为毫秒
 * 
 * @note 精度依赖于系统定时器
 * 
 * @example
 *   delay(1000);  // 延时1秒
 */
void delay(uint32_t ms);

#ifdef __cplusplus
}
#endif

#endif /* __GPIO_H__ */
