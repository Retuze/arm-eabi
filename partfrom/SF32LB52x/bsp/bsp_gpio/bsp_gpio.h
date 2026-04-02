#pragma once
#ifndef _BSP_GPIO_H_
#define _BSP_GPIO_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define INPUT           0x00U
#define OUTPUT          0x01U
#define INPUT_PULLUP    0x02U
#define INPUT_PULLDOWN  0x03U

#define LOW             0x00U
#define HIGH            0x01U

void pinMode(uint8_t pin, uint8_t mode);
void digitalWrite(uint8_t pin, uint8_t value);
uint8_t digitalRead(uint8_t pin);
void digitalToggle(uint8_t pin);

#ifdef __cplusplus
}
#endif

#endif /* _BSP_GPIO_H_ */
