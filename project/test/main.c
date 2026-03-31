#include <stdint.h>
#include "gpio.h"


extern uint32_t __Vectors;

#define SCB_VTOR (*(volatile uint32_t *)0xE000ED08U)

void SystemInit(void)
{
    /* Point VTOR to the vector table in flash */
    SCB_VTOR = (uint32_t)(uintptr_t)&__Vectors;
}


/* 系统时钟频率 - 默认时钟为 144MHz */
#define SYSTEM_CLOCK_FREQ 144000000UL
#define SYSTICK_FREQ_HZ  1000UL                 // SysTick 中断频率 1000Hz (1ms)

/* SysTick 寄存器定义 (ARM Cortex-M 标准) */
#define SYSTICK_BASE 0xE000E010
#define SYSTICK_CTRL  (*(volatile uint32_t*) (SYSTICK_BASE + 0x00))  // 控制和状态寄存器
#define SYSTICK_LOAD  (*(volatile uint32_t*) (SYSTICK_BASE + 0x04))  // 重装载值寄存器
#define SYSTICK_VAL   (*(volatile uint32_t*) (SYSTICK_BASE + 0x08))  // 当前值寄存器
#define SYSTICK_CALIB (*(volatile uint32_t*) (SYSTICK_BASE + 0x0C))  // 校准值寄存器

/* SysTick CTRL 寄存器位定义 */
#define SYSTICK_CTRL_ENABLE     (1UL << 0)      // 使能 SysTick
#define SYSTICK_CTRL_TICKINT    (1UL << 1)      // 使能 SysTick 中断
#define SYSTICK_CTRL_CLKSOURCE  (1UL << 2)      // 时钟源选择 (1=HCLK, 0=TICK_CLK)
#define SYSTICK_CTRL_COUNTFLAG  (1UL << 16)     // 计数标志位

/* 全局 tick 计数器 */
static volatile uint32_t systick_counter = 0;

/**
 * @brief SysTick 中断处理函数
 */
void SysTick_Handler(void)
{
    systick_counter++;
}

/**
 * @brief 配置 SysTick 为 1ms 中断
 * @param 无
 * @retval 0 成功, 1 失败
 */
uint32_t systick_config(void)
{
    uint32_t reload_value;
    
    /* 计算重装载值: reload = (系统时钟频率 / SysTick中断频率) - 1 */
    reload_value = (SYSTEM_CLOCK_FREQ / SYSTICK_FREQ_HZ) - 1UL;
    
    /* 检查重装载值是否超出 24 位范围 (0xFFFFFF) */
    if (reload_value > 0xFFFFFFUL)
    {
        return 1;  // 配置失败
    }
    
    /* 禁用 SysTick */
    SYSTICK_CTRL = 0;
    
    /* 设置重装载值 */
    SYSTICK_LOAD = reload_value;
    
    /* 清除当前值 */
    SYSTICK_VAL = 0;
    
    /* 配置并启动 SysTick:
     * - 使能 SysTick (ENABLE = 1)
     * - 使能中断 (TICKINT = 1)
     * - 选择 HCLK 作为时钟源 (CLKSOURCE = 1)
     */
    SYSTICK_CTRL = SYSTICK_CTRL_ENABLE | SYSTICK_CTRL_TICKINT | SYSTICK_CTRL_CLKSOURCE;
    
    return 0;  // 配置成功
}

/**
 * @brief 基于 SysTick 的毫秒延时函数
 * @param ms 延时毫秒数
 */
void delay_ms(uint32_t ms)
{
    uint32_t start_tick = systick_counter;
    
    /* 等待指定的 tick 数 */
    while ((systick_counter - start_tick) < ms)
    {
        __asm__("nop");  // 空操作，避免编译器优化
    }
}



int entry(void)
{
    /* 配置 SysTick (1ms 中断，使用默认144MHz时钟) */
    if (systick_config() != 0)
    {
        /* SysTick 配置失败，可以使用循环延时 */
        while(1);  // 或者返回错误
    }
    
    /* 配置 GPIO31 为输出（假设为 LED） */
    pinMode(31, OUTPUT);



    /* 主循环 */
    while (1)
    {
        digitalWrite(31, HIGH);   // 点亮LED
        delay_ms(500);
        digitalWrite(31, LOW);    // 熄灭LED
        delay_ms(500);

    }
    return 0;
}
