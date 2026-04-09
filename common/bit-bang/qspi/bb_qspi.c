#include "bb_qspi.h"

#include "bsp_gpio.h"
#include "board.h"

void qspi_init(void)
{
    pinMode(LCD_BL, OUTPUT);
    digitalWrite(LCD_BL, HIGH);

    pinMode(LCD_CLK, OUTPUT);
    pinMode(LCD_CS, OUTPUT);
    pinMode(LCD_D0, OUTPUT);
    pinMode(LCD_D1, OUTPUT);
    pinMode(LCD_D2, OUTPUT);
    pinMode(LCD_D3, OUTPUT);

    digitalWrite(LCD_CLK, LOW);
    digitalWrite(LCD_CS, HIGH);
    digitalWrite(LCD_D0, LOW);
    digitalWrite(LCD_D1, LOW);
    digitalWrite(LCD_D2, LOW);
    digitalWrite(LCD_D3, LOW);
}

void qspi_cmd_start(void)
{
    digitalWrite(LCD_CS, LOW);
}

void qspi_cmd_end(void)
{
    digitalWrite(LCD_CS, HIGH);
}

void qspi_send_byte(uint8_t data)
{
    uint8_t i;

    /* SPI Mode-0: 空闲低电平，边沿期间只翻转 CLK。 */
    digitalWrite(LCD_CLK, LOW);

    for (i = 0U; i < 8U; ++i) {
        /* 单线位序：MSB->LSB（bit7 先发）。 */
        digitalWrite(LCD_D0, (data & 0x80U) ? HIGH : LOW);
        /* 在时钟边沿发送当前位。 */
        digitalWrite(LCD_CLK, HIGH);
        digitalWrite(LCD_CLK, LOW);
        data <<= 1U;
    }
}

void qspi_send_byte_4wire(uint8_t data)
{
    digitalWrite(LCD_CLK, LOW);

    /* 第一拍发送高 4 位：D0<-bit4, D1<-bit5, D2<-bit6, D3<-bit7。 */
    digitalWrite(LCD_D0, (data & 0x10U) ? HIGH : LOW);
    digitalWrite(LCD_D1, (data & 0x20U) ? HIGH : LOW);
    digitalWrite(LCD_D2, (data & 0x40U) ? HIGH : LOW);
    digitalWrite(LCD_D3, (data & 0x80U) ? HIGH : LOW);
    digitalWrite(LCD_CLK, HIGH);
    digitalWrite(LCD_CLK, LOW);

    /* 第二拍发送低 4 位：D0<-bit0, D1<-bit1, D2<-bit2, D3<-bit3。 */
    digitalWrite(LCD_D0, (data & 0x01U) ? HIGH : LOW);
    digitalWrite(LCD_D1, (data & 0x02U) ? HIGH : LOW);
    digitalWrite(LCD_D2, (data & 0x04U) ? HIGH : LOW);
    digitalWrite(LCD_D3, (data & 0x08U) ? HIGH : LOW);
    digitalWrite(LCD_CLK, HIGH);
    digitalWrite(LCD_CLK, LOW);
}

void qspi_send_data(const uint8_t *data, uint16_t len)
{
    uint16_t i;

    for (i = 0U; i < len; ++i) {
        qspi_send_byte(data[i]);
    }
}

void qspi_send_data_4wire(const uint8_t *data, uint16_t len)
{
    uint16_t i;

    for (i = 0U; i < len; ++i) {
        qspi_send_byte_4wire(data[i]);
    }
}

uint8_t qspi_read_byte(void)
{
    uint8_t i;
    uint8_t data = 0U;

    digitalWrite(LCD_CLK, LOW);

    for (i = 0U; i < 8U; ++i) {
        /* 接收也按 MSB->LSB 组包。 */
        data <<= 1U;

        /* 上升沿采样 D0。 */
        digitalWrite(LCD_CLK, HIGH);
        if (digitalRead(LCD_D0) == HIGH) {
            data |= 0x01U;
        }
        digitalWrite(LCD_CLK, LOW);
    }

    return data;
}

void qspi_read_data(uint8_t *data, uint16_t len)
{
    uint16_t i;

    pinMode(LCD_D0, INPUT);

    for (i = 0U; i < len; ++i) {
        data[i] = qspi_read_byte();
    }

    pinMode(LCD_D0, OUTPUT);
}
