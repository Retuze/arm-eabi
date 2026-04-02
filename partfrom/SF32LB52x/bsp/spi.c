#include "spi.h"

#include "rcc.h"

static void sf32_spi_enable_clock(SPI_TypeDef *spi)
{
    if (spi == SPI1) {
        sf32_rcc_enable_module(SF32_RCC_MOD_SPI1);
    } else if (spi == SPI2) {
        sf32_rcc_enable_module(SF32_RCC_MOD_SPI2);
    }
}

void sf32_spi_init(SPI_TypeDef *spi, const sf32_spi_init_t *init)
{
    uint32_t top_ctrl = 0U;
    uint32_t clk_ctrl = SPI_CLK_CTRL_CLK_EN;
    uint32_t data_bits;

    if ((spi == 0) || (init == 0) || (init->data_bits == 0U)) {
        return;
    }

    sf32_spi_enable_clock(spi);

    data_bits = (init->data_bits - 1U) << SPI_TOP_CTRL_DSS_Pos;
    top_ctrl |= data_bits & SPI_TOP_CTRL_DSS_Msk;

    if ((init->mode & 0x2U) != 0U) {
        top_ctrl |= SPI_TOP_CTRL_SPO;
    }
    if ((init->mode & 0x1U) != 0U) {
        top_ctrl |= SPI_TOP_CTRL_SPH;
    }

    if (init->prescaler > 0U) {
        clk_ctrl |= (init->prescaler << SPI_CLK_CTRL_CLK_DIV_Pos) &
                    SPI_CLK_CTRL_CLK_DIV_Msk;
    } else {
        clk_ctrl |= SPI_CLK_CTRL_CLK_SEL;
    }

    spi->TOP_CTRL = 0U;
    spi->CLK_CTRL = clk_ctrl;
    spi->TOP_CTRL = top_ctrl | SPI_TOP_CTRL_SSE;
}

uint8_t sf32_spi_transfer_byte(SPI_TypeDef *spi, uint8_t value)
{
    while ((spi->STATUS & SPI_STATUS_TNF) == 0U) {
    }

    spi->DATA = value;

    while ((spi->STATUS & SPI_STATUS_RNE) == 0U) {
    }

    return (uint8_t)(spi->DATA & 0xFFU);
}

void sf32_spi_transfer(SPI_TypeDef *spi, const uint8_t *tx_data,
                       uint8_t *rx_data, uint32_t size)
{
    for (uint32_t i = 0; i < size; ++i) {
        uint8_t tx_value = (tx_data != 0) ? tx_data[i] : 0xFFU;
        uint8_t rx_value = sf32_spi_transfer_byte(spi, tx_value);

        if (rx_data != 0) {
            rx_data[i] = rx_value;
        }
    }

    while ((spi->STATUS & SPI_STATUS_BSY) != 0U) {
    }
}
