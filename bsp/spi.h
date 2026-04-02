#pragma once

#include <stdint.h>

#include "SF32LB52.h"

#ifdef __cplusplus
extern "C" {
#endif

#define SF32_SPI_MODE_0 0U
#define SF32_SPI_MODE_1 1U
#define SF32_SPI_MODE_2 2U
#define SF32_SPI_MODE_3 3U

typedef struct {
    uint32_t prescaler;
    uint8_t data_bits;
    uint8_t mode;
} sf32_spi_init_t;

void sf32_spi_init(SPI_TypeDef *spi, const sf32_spi_init_t *init);
uint8_t sf32_spi_transfer_byte(SPI_TypeDef *spi, uint8_t value);
void sf32_spi_transfer(SPI_TypeDef *spi, const uint8_t *tx_data,
                       uint8_t *rx_data, uint32_t size);

#ifdef __cplusplus
}
#endif
