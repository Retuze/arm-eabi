#include "gpio.h"
#include "SF32LB52x.h"
/**
 * @brief 配置GPIO引脚模式
 * @param pin 引脚编号 (0-31 对应 GPIO0-GPIO31)
 * @param mode 引脚模式 (INPUT, OUTPUT, INPUT_PULLUP, INPUT_PULLDOWN)
 */
void pinMode(uint8_t pin, uint8_t mode)
{
    uint32_t pin_mask;
    
    /* 参数检查 */
    if (pin > 31)
    {
        return;  /* 无效引脚编号 */
    }
    
    pin_mask = (1UL << pin);
    
    /* 使能GPIO1时钟（如果尚未使能） */
    HPSYS_RCC->ENR2.R |= (1UL << 0);  /* 使能GPIO1时钟 */
    HPSYS_RCC->ESR2.R |= (1UL << 0);  /* 设置GPIO1时钟使能 */
    
    switch (mode)
    {
        case INPUT:
            /* 输入模式：禁用输出使能 */
            HPSYS_GPIO->DOECR0.R |= pin_mask;
            /* TODO: 配置上拉下拉为禁用（如果硬件支持） */
            break;
            
        case OUTPUT:
            /* 输出模式：使能输出 */
            HPSYS_GPIO->DOESR0.R |= pin_mask;
            break;
            
        case INPUT_PULLUP:
            /* 输入模式，内部上拉：禁用输出使能 */
            HPSYS_GPIO->DOECR0.R |= pin_mask;
            /* TODO: 配置上拉（如果硬件支持） */
            break;
            
        case INPUT_PULLDOWN:
            /* 输入模式，内部下拉：禁用输出使能 */
            HPSYS_GPIO->DOECR0.R |= pin_mask;
            /* TODO: 配置下拉（如果硬件支持） */
            break;
            
        default:
            /* 无效模式 */
            break;
    }
}

/**
 * @brief 写GPIO引脚电平
 * @param pin 引脚编号 (0-31)
 * @param value 电平值 (LOW=0, HIGH=1)
 */
void digitalWrite(uint8_t pin, uint8_t value)
{
    uint32_t pin_mask;
    
    /* 参数检查 */
    if (pin > 31)
    {
        return;  /* 无效引脚编号 */
    }
    
    pin_mask = (1UL << pin);
    
    if (value == HIGH)
    {
        /* 输出高电平 */
        HPSYS_GPIO->DOSR0.R |= pin_mask;
    }
    else
    {
        /* 输出低电平 */
        HPSYS_GPIO->DOCR0.R |= pin_mask;
    }
}

/**
 * @brief 读GPIO引脚电平
 * @param pin 引脚编号 (0-31)
 * @return 引脚电平值 (LOW=0, HIGH=1)
 */
uint8_t digitalRead(uint8_t pin)
{
    uint32_t pin_mask;
    uint32_t value;
    
    /* 参数检查 */
    if (pin > 31)
    {
        return LOW;  /* 无效引脚编号，返回LOW */
    }
    
    pin_mask = (1UL << pin);
    
    /* 读取输入寄存器 */
    value = HPSYS_GPIO->DIR0.R;
    
    /* 检查对应位 */
    if ((value & pin_mask) != 0)
    {
        return HIGH;
    }
    else
    {
        return LOW;
    }
}

/**
 * @brief 翻转GPIO引脚电平
 * @param pin 引脚编号 (0-31)
 */
void digitalToggle(uint8_t pin)
{
    uint8_t current_value;
    
    /* 读取当前电平 */
    current_value = digitalRead(pin);
    
    /* 写入相反的电平 */
    digitalWrite(pin, (current_value == HIGH) ? LOW : HIGH);
}
