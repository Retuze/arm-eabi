#include "bsp_gpio.h"
#include "board.h"

/**
 * @brief 初始化GPIO模拟QSPI接口
 */
void qspi_init(void)
{
    /* 配置背光引脚为输出模式并拉高（供电） */
    pinMode(LCD_BL, OUTPUT);
    digitalWrite(LCD_BL, HIGH);
    
    /* 配置所有QSPI引脚为输出模式 */
    pinMode(LCD_CLK, OUTPUT);
    pinMode(LCD_CS, OUTPUT);
    pinMode(LCD_D0, OUTPUT);
    pinMode(LCD_D1, OUTPUT);
    pinMode(LCD_D2, OUTPUT);
    pinMode(LCD_D3, OUTPUT);
    
    /* 初始化引脚状态 */
    digitalWrite(LCD_CLK, LOW);   /* 时钟空闲为低（SPI模式0：CPOL=0） */
    digitalWrite(LCD_CS, HIGH);   /* CS空闲为高（不选中） */
    digitalWrite(LCD_D0, LOW);
    digitalWrite(LCD_D1, LOW);
    digitalWrite(LCD_D2, LOW);
    digitalWrite(LCD_D3, LOW);
}

/**
 * @brief 命令开始，拉低CS引脚
 * @note 在发送命令和数据前调用此函数，表示命令开始
 */
void qspi_cmd_start(void)
{
    digitalWrite(LCD_CS, LOW);
}

/**
 * @brief 命令结束，拉高CS引脚
 * @note 在发送完命令和数据后调用此函数，表示命令结束
 */
void qspi_cmd_end(void)
{
    digitalWrite(LCD_CS, HIGH);
}

/**
 * @brief 发送一个字节（单线模式，使用D0）
 * @param data 要发送的数据
 * @note 字节内位顺序：MSB优先（从bit7到bit0）
 */
void qspi_send_byte(uint8_t data)
{
    uint8_t i;
    
    /* SPI模式0：CPOL=0（时钟空闲为低），CPHA=0（数据在上升沿采样） */
    /* 确保时钟处于空闲状态（低电平） */
    digitalWrite(LCD_CLK, LOW);
    
    /* 从MSB开始发送（bit7 -> bit0） */
    for (i = 0; i < 8; i++) {
        /* 设置数据位（在时钟上升沿之前设置） */
        digitalWrite(LCD_D0, (data & 0x80) ? HIGH : LOW);
        
        /* 时钟上升沿（数据采样） */
        digitalWrite(LCD_CLK, HIGH);
        
        /* 时钟下降沿（准备下一位，回到空闲状态） */
        digitalWrite(LCD_CLK, LOW);
        
        data <<= 1;  /* 左移，准备下一位 */
    }
}

/**
 * @brief 发送一个字节（4线模式，使用D0-D3）
 * @param data 要发送的数据（完整8位，分两次发送：先高4位，后低4位）
 * @note 字节内位顺序：MSB优先（先发送bit7-4，再发送bit3-0）
 */
void qspi_send_byte_4wire(uint8_t data)
{
    /* SPI模式0：CPOL=0（时钟空闲为低），CPHA=0（数据在上升沿采样） */
    /* 确保时钟处于空闲状态（低电平） */
    digitalWrite(LCD_CLK, LOW);
    
    /* 先发送高4位（MSB：bit7-4） */
    /* 根据时序图：D0->bit4, D1->bit5, D2->bit6, D3->bit7 */
    digitalWrite(LCD_D0, (data & 0x10) ? HIGH : LOW);  /* bit 4 -> D0 */
    digitalWrite(LCD_D1, (data & 0x20) ? HIGH : LOW);  /* bit 5 -> D1 */
    digitalWrite(LCD_D2, (data & 0x40) ? HIGH : LOW);  /* bit 6 -> D2 */
    digitalWrite(LCD_D3, (data & 0x80) ? HIGH : LOW);  /* bit 7 -> D3 */
    
    /* 时钟上升沿（数据采样） */
    digitalWrite(LCD_CLK, HIGH);
    
    /* 时钟下降沿（准备下一位，回到空闲状态） */
    digitalWrite(LCD_CLK, LOW);
    
    /* 再发送低4位（LSB：bit3-0） */
    /* 根据时序图：D0->bit0, D1->bit1, D2->bit2, D3->bit3 */
    digitalWrite(LCD_D0, (data & 0x01) ? HIGH : LOW);  /* bit 0 -> D0 */
    digitalWrite(LCD_D1, (data & 0x02) ? HIGH : LOW);  /* bit 1 -> D1 */
    digitalWrite(LCD_D2, (data & 0x04) ? HIGH : LOW);  /* bit 2 -> D2 */
    digitalWrite(LCD_D3, (data & 0x08) ? HIGH : LOW);  /* bit 3 -> D3 */
    
    /* 时钟上升沿（数据采样） */
    digitalWrite(LCD_CLK, HIGH);
    
    /* 时钟下降沿（准备下一位，回到空闲状态） */
    digitalWrite(LCD_CLK, LOW);
}

/**
 * @brief 发送数据（单线模式）
 * @param data 数据缓冲区
 * @param len 数据长度
 * @note 字节内：MSB优先；多字节数据：按数组顺序发送
 */
void qspi_send_data(const uint8_t *data, uint16_t len)
{
    uint16_t i;
    
    for (i = 0; i < len; i++) {
        qspi_send_byte(data[i]);
    }
}

/**
 * @brief 发送数据（4线模式）
 * @param data 数据缓冲区
 * @param len 数据长度
 * @note 字节内：MSB优先；多字节数据：按数组顺序发送
 */
void qspi_send_data_4wire(const uint8_t *data, uint16_t len)
{
    uint16_t i;
    
    for (i = 0; i < len; i++) {
        qspi_send_byte_4wire(data[i]);
    }
}

/**
 * @brief 读取一个字节（单线模式，使用D0）
 * @return 读取的数据字节
 */
uint8_t qspi_read_byte(void)
{
    uint8_t i;
    uint8_t data = 0;
    uint8_t bit_val;
    
    /* SPI模式0：CPOL=0，CPHA=0 */
    digitalWrite(LCD_CLK, LOW);
    
    /* 从MSB开始读取 */
    for (i = 0; i < 8; i++) {
        /* 在时钟上升沿采样数据位 */
        bit_val = digitalRead(LCD_D0);

        /* 时钟上升沿（从设备输出数据，主设备采样） */
        digitalWrite(LCD_CLK, HIGH);
        
        /* 左移并设置数据位 */
        data <<= 1;
        if (bit_val == HIGH) {
            data |= 0x01;  /* 设置最低位 */
        }
        
        /* 时钟下降沿（准备下一位，回到空闲状态） */
        digitalWrite(LCD_CLK, LOW);
    }
    
    return data;
}

/**
 * @brief 读取数据（单线模式）
 * @param data 数据缓冲区
 * @param len 数据长度
 */
void qspi_read_data(uint8_t *data, uint16_t len)
{
    uint16_t i;
    
    /* 配置D0为输入模式 */
    pinMode(LCD_D0, INPUT);
    
    /* 读取所有数据 */
    for (i = 0; i < len; i++) {
        data[i] = qspi_read_byte();
    }
    
    /* 恢复D0为输出模式 */
    pinMode(LCD_D0, OUTPUT);
}
