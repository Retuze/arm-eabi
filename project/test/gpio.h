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
 * @param pin 引脚编号 (0-31 对应 GPIO0-GPIO31)
 * @param mode 引脚模式 (INPUT, OUTPUT, INPUT_PULLUP, INPUT_PULLDOWN)
 * 
 * @note 此函数会自动使能GPIO1时钟
 * 
 * @example
 *   pinMode(13, OUTPUT);        // 配置GPIO13为输出
 *   pinMode(2, INPUT_PULLUP);    // 配置GPIO2为输入，内部上拉
 */
void pinMode(uint8_t pin, uint8_t mode);

/**
 * @brief 写GPIO引脚电平
 * @param pin 引脚编号 (0-31)
 * @param value 电平值 (LOW=0, HIGH=1)
 * 
 * @note 引脚必须配置为OUTPUT模式
 * 
 * @example
 *   digitalWrite(13, HIGH);     // GPIO13输出高电平
 *   digitalWrite(13, LOW);       // GPIO13输出低电平
 */
void digitalWrite(uint8_t pin, uint8_t value);

/**
 * @brief 读GPIO引脚电平
 * @param pin 引脚编号 (0-31)
 * @return 引脚电平值 (LOW=0, HIGH=1)
 * 
 * @note 引脚必须配置为INPUT或INPUT_PULLUP/INPUT_PULLDOWN模式
 * 
 * @example
 *   uint8_t value = digitalRead(2);  // 读取GPIO2的电平
 */
uint8_t digitalRead(uint8_t pin);

/**
 * @brief 翻转GPIO引脚电平
 * @param pin 引脚编号 (0-31)
 * 
 * @note 引脚必须配置为OUTPUT模式
 * 
 * @example
 *   digitalToggle(13);  // 翻转GPIO13的电平
 */
void digitalToggle(uint8_t pin);

#ifdef __cplusplus
}
#endif

#endif /* __GPIO_H__ */
