#pragma once

#include <stdint.h>

#include "SF32LB52.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    uint32_t clock_hz;
    uint8_t own_address;
    uint8_t digital_filter;
} sf32_i2c_init_t;

void sf32_i2c_init(I2C_TypeDef *i2c, const sf32_i2c_init_t *init);
int sf32_i2c_master_write(I2C_TypeDef *i2c, uint8_t address,
                          const uint8_t *data, uint32_t size);
int sf32_i2c_master_read(I2C_TypeDef *i2c, uint8_t address,
                         uint8_t *data, uint32_t size);
int sf32_i2c_mem_write(I2C_TypeDef *i2c, uint8_t address, uint8_t reg,
                       const uint8_t *data, uint32_t size);
int sf32_i2c_mem_read(I2C_TypeDef *i2c, uint8_t address, uint8_t reg,
                      uint8_t *data, uint32_t size);

#ifdef __cplusplus
}
#endif
