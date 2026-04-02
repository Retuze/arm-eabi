#include "i2c.h"

#include "rcc.h"

#ifndef SF32_I2C_CLOCK_HZ
#define SF32_I2C_CLOCK_HZ 48000000UL
#endif

#define SF32_I2C_MODE_STANDARD 0U
#define SF32_I2C_MODE_FAST     1U

static void sf32_i2c_enable_clock(I2C_TypeDef *i2c)
{
    if (i2c == I2C1) {
        sf32_rcc_enable_module(SF32_RCC_MOD_I2C1);
    } else if (i2c == I2C2) {
        sf32_rcc_enable_module(SF32_RCC_MOD_I2C2);
    } else if (i2c == I2C3) {
        sf32_rcc_enable_module(SF32_RCC_MOD_I2C3);
    } else if (i2c == I2C4) {
        sf32_rcc_enable_module(SF32_RCC_MOD_I2C4);
    }
}

static int sf32_i2c_wait_tx(I2C_TypeDef *i2c)
{
    while ((i2c->SR & (I2C_SR_NACK | I2C_SR_BED | I2C_SR_ALD)) == 0U) {
        if ((i2c->SR & I2C_SR_TE) != 0U) {
            i2c->SR = I2C_SR_TE;
            return 0;
        }
    }

    return -1;
}

static int sf32_i2c_wait_rx(I2C_TypeDef *i2c)
{
    while ((i2c->SR & (I2C_SR_NACK | I2C_SR_BED | I2C_SR_ALD)) == 0U) {
        if ((i2c->SR & I2C_SR_RF) != 0U) {
            return 0;
        }
    }

    return -1;
}

static int sf32_i2c_wait_stop(I2C_TypeDef *i2c)
{
    while ((i2c->SR & (I2C_SR_MSD | I2C_SR_BED | I2C_SR_ALD)) == 0U) {
    }

    if ((i2c->SR & (I2C_SR_BED | I2C_SR_ALD)) != 0U) {
        return -1;
    }

    i2c->SR = I2C_SR_MSD;
    return 0;
}

static int sf32_i2c_send_address(I2C_TypeDef *i2c, uint8_t address_rw)
{
    i2c->SR = I2C_SR_TE | I2C_SR_NACK | I2C_SR_BED | I2C_SR_ALD;
    i2c->DBR = address_rw;
    i2c->TCR = I2C_TCR_START | I2C_TCR_TB;
    return sf32_i2c_wait_tx(i2c);
}

void sf32_i2c_init(I2C_TypeDef *i2c, const sf32_i2c_init_t *init)
{
    uint32_t dnf;
    uint32_t speed;
    uint32_t mode;
    uint32_t flv;
    uint32_t cnt;
    uint32_t cr;

    if ((i2c == 0) || (init == 0)) {
        return;
    }

    sf32_i2c_enable_clock(i2c);

    speed = (init->clock_hz == 0U) ? 100000U : init->clock_hz;
    dnf = init->digital_filter & 0x7U;
    mode = (speed > 100000U) ? SF32_I2C_MODE_FAST : SF32_I2C_MODE_STANDARD;

    flv = ((SF32_I2C_CLOCK_HZ + (speed >> 1)) / speed - dnf - 6U) / 2U;
    if (flv > 0x1FFU) {
        flv = 0x1FFU;
    }

    cnt = flv / 2U;
    cnt = (cnt < 3U) ? 0U : (cnt - 3U);

    cr = ((mode << I2C_CR_MODE_Pos) & I2C_CR_MODE_Msk) |
         ((dnf << I2C_CR_DNF_Pos) & I2C_CR_DNF_Msk) |
         I2C_CR_IUE | I2C_CR_SCLE | I2C_CR_MSDE;

    i2c->CR = I2C_CR_UR;
    i2c->CR = 0U;
    MODIFY_REG(i2c->LCR, I2C_LCR_FLV_Msk, flv << I2C_LCR_FLV_Pos);
    MODIFY_REG(i2c->LCR, I2C_LCR_SLV_Msk, I2C_LCR_SLV_Msk);
    MODIFY_REG(i2c->WCR, I2C_WCR_CNT_Msk, cnt << I2C_WCR_CNT_Pos);
    i2c->IER = 0U;
    i2c->SAR = init->own_address & 0x7FU;
    i2c->CR = cr;
}

int sf32_i2c_master_write(I2C_TypeDef *i2c, uint8_t address,
                          const uint8_t *data, uint32_t size)
{
    if ((i2c == 0) || ((data == 0) && (size != 0U))) {
        return -1;
    }

    if (sf32_i2c_send_address(i2c, (uint8_t)(address << 1)) != 0) {
        return -1;
    }

    for (uint32_t i = 0; i < size; ++i) {
        i2c->DBR = data[i];
        i2c->TCR = (i == (size - 1U)) ? (I2C_TCR_TB | I2C_TCR_STOP) :
                                        I2C_TCR_TB;
        if (sf32_i2c_wait_tx(i2c) != 0) {
            return -1;
        }
    }

    return sf32_i2c_wait_stop(i2c);
}

int sf32_i2c_master_read(I2C_TypeDef *i2c, uint8_t address,
                         uint8_t *data, uint32_t size)
{
    if ((i2c == 0) || ((data == 0) && (size != 0U))) {
        return -1;
    }

    if (sf32_i2c_send_address(i2c, (uint8_t)((address << 1) | 1U)) != 0) {
        return -1;
    }

    for (uint32_t i = 0; i < size; ++i) {
        i2c->TCR = (i == (size - 1U)) ?
                       (I2C_TCR_TB | I2C_TCR_STOP | I2C_TCR_NACK) :
                       I2C_TCR_TB;

        if (sf32_i2c_wait_rx(i2c) != 0) {
            return -1;
        }

        data[i] = (uint8_t)(i2c->DBR & 0xFFU);
        i2c->SR = I2C_SR_RF;
    }

    return sf32_i2c_wait_stop(i2c);
}

int sf32_i2c_mem_write(I2C_TypeDef *i2c, uint8_t address, uint8_t reg,
                       const uint8_t *data, uint32_t size)
{
    if (sf32_i2c_send_address(i2c, (uint8_t)(address << 1)) != 0) {
        return -1;
    }

    i2c->DBR = reg;
    i2c->TCR = (size == 0U) ? (I2C_TCR_TB | I2C_TCR_STOP) : I2C_TCR_TB;
    if (sf32_i2c_wait_tx(i2c) != 0) {
        return -1;
    }

    for (uint32_t i = 0; i < size; ++i) {
        i2c->DBR = data[i];
        i2c->TCR = (i == (size - 1U)) ? (I2C_TCR_TB | I2C_TCR_STOP) :
                                        I2C_TCR_TB;
        if (sf32_i2c_wait_tx(i2c) != 0) {
            return -1;
        }
    }

    return sf32_i2c_wait_stop(i2c);
}

int sf32_i2c_mem_read(I2C_TypeDef *i2c, uint8_t address, uint8_t reg,
                      uint8_t *data, uint32_t size)
{
    if (sf32_i2c_send_address(i2c, (uint8_t)(address << 1)) != 0) {
        return -1;
    }

    i2c->DBR = reg;
    i2c->TCR = I2C_TCR_TB;
    if (sf32_i2c_wait_tx(i2c) != 0) {
        return -1;
    }

    return sf32_i2c_master_read(i2c, address, data, size);
}
