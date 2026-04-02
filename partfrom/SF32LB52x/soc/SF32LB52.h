#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef union {
    volatile uint32_t R;
} SF32_REG32;

#define READ_REG(REG)        ((REG))
#define WRITE_REG(REG, VAL)  ((REG) = (VAL))
#define SET_BIT(REG, BIT)    ((REG) |= (BIT))
#define CLEAR_BIT(REG, BIT)  ((REG) &= ~(BIT))
#define READ_BIT(REG, BIT)   ((REG) & (BIT))
#define MODIFY_REG(REG, CLEARMASK, SETMASK) \
    WRITE_REG((REG), (((REG) & ~(CLEARMASK)) | (SETMASK)))

#define HPSYS_RCC_BASE       (0x50000000UL)
#define HPSYS_PINMUX_BASE    (0x50003000UL)
#define USART1_BASE          (0x50084000UL)
#define USART2_BASE          (0x50085000UL)
#define USART3_BASE          (0x50086000UL)
#define GPTIM1_BASE          (0x50090000UL)
#define BTIM1_BASE           (0x50092000UL)
#define SPI1_BASE            (0x50095000UL)
#define SPI2_BASE            (0x50096000UL)
#define I2C1_BASE            (0x5009C000UL)
#define I2C2_BASE            (0x5009D000UL)
#define I2C3_BASE            (0x5009E000UL)
#define I2C4_BASE            (0x5009F000UL)
#define HPSYS_GPIO_BASE      (0x500A0000UL)
#define GPTIM2_BASE          (0x500B0000UL)
#define BTIM2_BASE           (0x500B1000UL)
#define PMUC_BASE            (0x500CA000UL)

#define PINMUX1_BASE         HPSYS_PINMUX_BASE
#define GPIO1_BASE           HPSYS_GPIO_BASE

#define HPSYS_PINMUX_PAD_COUNT 58U

#define HPSYS_RCC_ENR1_PINMUX1   (1UL << 2)
#define HPSYS_RCC_ENR1_SYSCFG1   (1UL << 10)
#define HPSYS_RCC_ENR1_GPTIM1    (1UL << 15)
#define HPSYS_RCC_ENR1_GPTIM2    (1UL << 16)
#define HPSYS_RCC_ENR1_BTIM1     (1UL << 17)
#define HPSYS_RCC_ENR1_BTIM2     (1UL << 18)
#define HPSYS_RCC_ENR1_SPI1      (1UL << 20)
#define HPSYS_RCC_ENR1_SPI2      (1UL << 21)
#define HPSYS_RCC_ENR1_I2C1      (1UL << 27)
#define HPSYS_RCC_ENR1_I2C2      (1UL << 28)
#define HPSYS_RCC_ENR2_GPIO1     (1UL << 0)
#define HPSYS_RCC_ENR2_MPI2      (1UL << 2)
#define HPSYS_RCC_ENR2_I2C3      (1UL << 8)
#define HPSYS_RCC_ENR2_USART3    (1UL << 12)
#define HPSYS_RCC_ENR2_I2C4      (1UL << 25)

#define HPSYS_RCC_CSR_SEL_SYS_Pos    0U
#define HPSYS_RCC_CSR_SEL_SYS_Msk    (0x3UL << HPSYS_RCC_CSR_SEL_SYS_Pos)
#define HPSYS_RCC_CSR_SEL_MPI2_Pos   6U
#define HPSYS_RCC_CSR_SEL_MPI2_Msk   (0x3UL << HPSYS_RCC_CSR_SEL_MPI2_Pos)
#define HPSYS_RCC_CSR_SEL_PERI_Pos   12U
#define HPSYS_RCC_CSR_SEL_PERI_Msk   (0x1UL << HPSYS_RCC_CSR_SEL_PERI_Pos)

#define HPSYS_RCC_CFGR_HDIV_Pos      0U
#define HPSYS_RCC_CFGR_HDIV_Msk      (0xFFUL << HPSYS_RCC_CFGR_HDIV_Pos)

#define HPSYS_RCC_DLL2CR_EN          (1UL << 0)
#define HPSYS_RCC_DLL2CR_SW          (1UL << 1)
#define HPSYS_RCC_DLL2CR_STG_Pos     2U
#define HPSYS_RCC_DLL2CR_STG_Msk     (0xFUL << HPSYS_RCC_DLL2CR_STG_Pos)
#define HPSYS_RCC_DLL2CR_XTALIN_EN   (1UL << 6)
#define HPSYS_RCC_DLL2CR_OUT_DIV2_EN (1UL << 13)
#define HPSYS_RCC_DLL2CR_PU_DLY_Pos  25U
#define HPSYS_RCC_DLL2CR_PU_DLY_Msk  (0x7UL << HPSYS_RCC_DLL2CR_PU_DLY_Pos)
#define HPSYS_RCC_DLL2CR_LOCK_DLY_Pos 28U
#define HPSYS_RCC_DLL2CR_LOCK_DLY_Msk (0x7UL << HPSYS_RCC_DLL2CR_LOCK_DLY_Pos)

#define PMUC_HXT_CR1_EN          (1UL << 0)
#define PMUC_HXT_CR1_BUF_EN      (1UL << 1)
#define PMUC_HXT_CR1_BUF_DIG_EN  (1UL << 2)
#define PMUC_HXT_CR1_BUF_DLL_EN  (1UL << 5)
#define PMUC_HXT_CR1_GM_EN       (1UL << 19)
#define PMUC_PERI_LDO_EN_VDD33_LDO2 (1UL << 8)

#define HPSYS_PINMUX_PAD_FSEL_Pos    0U
#define HPSYS_PINMUX_PAD_FSEL_Msk    (0xFUL << HPSYS_PINMUX_PAD_FSEL_Pos)
#define HPSYS_PINMUX_PAD_PE_Msk      (1UL << 4)
#define HPSYS_PINMUX_PAD_PS_Msk      (1UL << 5)
#define HPSYS_PINMUX_PAD_IE_Msk      (1UL << 6)
#define HPSYS_PINMUX_PAD_IS_Msk      (1UL << 7)
#define HPSYS_PINMUX_PAD_SR_Msk      (1UL << 8)
#define HPSYS_PINMUX_PAD_DS0_Msk     (1UL << 9)
#define HPSYS_PINMUX_PAD_DS1_Msk     (1UL << 10)

#define USART_CR1_UE             (1UL << 0)
#define USART_CR1_RE             (1UL << 2)
#define USART_CR1_TE             (1UL << 3)
#define USART_CR1_RXNEIE         (1UL << 5)
#define USART_CR1_TXEIE          (1UL << 7)
#define USART_CR1_PS             (1UL << 9)
#define USART_CR1_PCE            (1UL << 10)
#define USART_CR1_OVER8          (1UL << 14)
#define USART_CR1_M_Pos          27U
#define USART_CR1_M_Msk          (0x3UL << USART_CR1_M_Pos)
#define USART_CR2_STOP_Pos       12U
#define USART_CR2_STOP_Msk       (0x3UL << USART_CR2_STOP_Pos)
#define USART_CR3_ONEBIT         (1UL << 11)
#define USART_ISR_PE             (1UL << 0)
#define USART_ISR_FE             (1UL << 1)
#define USART_ISR_NF             (1UL << 2)
#define USART_ISR_ORE            (1UL << 3)
#define USART_ISR_IDLE           (1UL << 4)
#define USART_ISR_RXNE           (1UL << 5)
#define USART_ISR_TC             (1UL << 6)
#define USART_ISR_TXE            (1UL << 7)
#define USART_ICR_PECF           (1UL << 0)
#define USART_ICR_FECF           (1UL << 1)
#define USART_ICR_NCF            (1UL << 2)
#define USART_ICR_ORECF          (1UL << 3)
#define USART_ICR_IDLECF         (1UL << 4)

#define SPI_TOP_CTRL_SSE         (1UL << 0)
#define SPI_TOP_CTRL_DSS_Pos     5U
#define SPI_TOP_CTRL_DSS_Msk     (0x1FUL << SPI_TOP_CTRL_DSS_Pos)
#define SPI_TOP_CTRL_SPO         (1UL << 10)
#define SPI_TOP_CTRL_SPH         (1UL << 11)
#define SPI_STATUS_BSY           (1UL << 0)
#define SPI_STATUS_TNF           (1UL << 6)
#define SPI_STATUS_RNE           (1UL << 14)
#define SPI_CLK_CTRL_CLK_DIV_Pos 0U
#define SPI_CLK_CTRL_CLK_DIV_Msk (0x7FUL << SPI_CLK_CTRL_CLK_DIV_Pos)
#define SPI_CLK_CTRL_CLK_SEL     (1UL << 7)
#define SPI_CLK_CTRL_CLK_EN      (1UL << 8)

#define I2C_CR_MODE_Pos          0U
#define I2C_CR_MODE_Msk          (0x3UL << I2C_CR_MODE_Pos)
#define I2C_CR_IUE               (1UL << 2)
#define I2C_CR_SCLE              (1UL << 3)
#define I2C_CR_MSDE              (1UL << 8)
#define I2C_CR_DNF_Pos           12U
#define I2C_CR_DNF_Msk           (0x7UL << I2C_CR_DNF_Pos)
#define I2C_CR_SLVEN             (1UL << 11)
#define I2C_CR_UR                (1UL << 31)
#define I2C_TCR_TB               (1UL << 0)
#define I2C_TCR_START            (1UL << 1)
#define I2C_TCR_STOP             (1UL << 2)
#define I2C_TCR_NACK             (1UL << 3)
#define I2C_TCR_MA               (1UL << 4)
#define I2C_SR_NACK              (1UL << 1)
#define I2C_SR_TE                (1UL << 6)
#define I2C_SR_RF                (1UL << 7)
#define I2C_SR_MSD               (1UL << 12)
#define I2C_SR_BED               (1UL << 10)
#define I2C_SR_ALD               (1UL << 5)
#define I2C_LCR_SLV_Pos          0U
#define I2C_LCR_SLV_Msk          (0x1FFUL << I2C_LCR_SLV_Pos)
#define I2C_LCR_FLV_Pos          9U
#define I2C_LCR_FLV_Msk          (0x1FFUL << I2C_LCR_FLV_Pos)
#define I2C_WCR_CNT_Pos          0U
#define I2C_WCR_CNT_Msk          (0xFFUL << I2C_WCR_CNT_Pos)

#define GPTIM_CR1_CEN            (1UL << 0)
#define GPTIM_CR1_DIR            (1UL << 4)
#define GPTIM_CR1_ARPE           (1UL << 7)
#define GPTIM_DIER_UIE           (1UL << 0)
#define GPTIM_SR_UIF             (1UL << 0)
#define GPTIM_EGR_UG             (1UL << 0)
#define GPTIM_CCMR_OC1PE         (1UL << 19)
#define GPTIM_CCMR_OC1M_Pos      20U
#define GPTIM_CCMR_OC1M_Msk      (0xFUL << GPTIM_CCMR_OC1M_Pos)
#define GPTIM_OC_MODE_FROZEN     (0x0UL << GPTIM_CCMR_OC1M_Pos)
#define GPTIM_OC_MODE_PWM1       (0x6UL << GPTIM_CCMR_OC1M_Pos)
#define GPTIM_OC_MODE_PWM2       (0x7UL << GPTIM_CCMR_OC1M_Pos)
#define GPTIM_CCER_CC1E          (1UL << 0)
#define GPTIM_CCER_CC1P          (1UL << 1)

typedef struct {
    SF32_REG32 RSTR1;
    SF32_REG32 RSTR2;
    SF32_REG32 ENR1;
    SF32_REG32 ENR2;
    SF32_REG32 ESR1;
    SF32_REG32 ESR2;
    SF32_REG32 ECR1;
    SF32_REG32 ECR2;
    SF32_REG32 CSR;
    SF32_REG32 CFGR;
    SF32_REG32 USBCR;
    SF32_REG32 DLL1CR;
    SF32_REG32 DLL2CR;
    SF32_REG32 HRCCAL1;
    SF32_REG32 HRCCAL2;
    SF32_REG32 DBGCLKR;
    SF32_REG32 DBGR;
    SF32_REG32 DWCFGR;
} HPSYS_RCC_TypeDef;

typedef struct {
    SF32_REG32 PAD[HPSYS_PINMUX_PAD_COUNT];
} HPSYS_PINMUX_TypeDef;

typedef struct {
    SF32_REG32 DIR0;
    SF32_REG32 DOR0;
    SF32_REG32 DOSR0;
    SF32_REG32 DOCR0;
    SF32_REG32 DOER0;
    SF32_REG32 DOESR0;
    SF32_REG32 DOECR0;
    SF32_REG32 IER0;
    SF32_REG32 IESR0;
    SF32_REG32 IECR0;
    SF32_REG32 ITR0;
    SF32_REG32 ITSR0;
    SF32_REG32 ITCR0;
    SF32_REG32 IPHR0;
    SF32_REG32 IPHSR0;
    SF32_REG32 IPHCR0;
    SF32_REG32 IPLR0;
    SF32_REG32 IPLSR0;
    SF32_REG32 IPLCR0;
    SF32_REG32 ISR0;
    SF32_REG32 RSVD3;
    SF32_REG32 RESERVED21[3];
    SF32_REG32 OEMR0;
    SF32_REG32 OEMSR0;
    SF32_REG32 OEMCR0;
    SF32_REG32 RSVD2;
    SF32_REG32 RESERVED28[4];
    SF32_REG32 DIR1;
    SF32_REG32 DOR1;
    SF32_REG32 DOSR1;
    SF32_REG32 DOCR1;
    SF32_REG32 DOER1;
    SF32_REG32 DOESR1;
    SF32_REG32 DOECR1;
    SF32_REG32 IER1;
    SF32_REG32 IESR1;
    SF32_REG32 IECR1;
    SF32_REG32 ITR1;
    SF32_REG32 ITSR1;
    SF32_REG32 ITCR1;
    SF32_REG32 IPHR1;
    SF32_REG32 IPHSR1;
    SF32_REG32 IPHCR1;
    SF32_REG32 IPLR1;
    SF32_REG32 IPLSR1;
    SF32_REG32 IPLCR1;
    SF32_REG32 ISR1;
    SF32_REG32 RSVD1;
    SF32_REG32 RESERVED53[3];
    SF32_REG32 OEMR1;
    SF32_REG32 OEMSR1;
    SF32_REG32 OEMCR1;
} HPSYS_GPIO_TypeDef;

typedef HPSYS_GPIO_TypeDef GPIO1_TypeDef;

typedef struct {
    volatile uint32_t CR1;
    volatile uint32_t CR2;
    volatile uint32_t CR3;
    volatile uint32_t BRR;
    volatile uint32_t RESERVED0[2];
    volatile uint32_t RQR;
    volatile uint32_t ISR;
    volatile uint32_t ICR;
    volatile uint32_t RDR;
    volatile uint32_t TDR;
} USART_TypeDef;

typedef struct {
    volatile uint32_t TOP_CTRL;
    volatile uint32_t FIFO_CTRL;
    volatile uint32_t INTE;
    volatile uint32_t TO;
    volatile uint32_t DATA;
    volatile uint32_t STATUS;
    volatile uint32_t RESERVED0[3];
    volatile uint32_t RWOT_CTRL;
    volatile uint32_t RWOT_CCM;
    volatile uint32_t RWOT_CVWRN;
    volatile uint32_t RESERVED1[3];
    volatile uint32_t CLK_CTRL;
} SPI_TypeDef;

typedef struct {
    volatile uint32_t CR;
    volatile uint32_t TCR;
    volatile uint32_t IER;
    volatile uint32_t SR;
    volatile uint32_t DBR;
    volatile uint32_t SAR;
    volatile uint32_t LCR;
    volatile uint32_t WCR;
    volatile uint32_t RCCR;
    volatile uint32_t BMR;
    volatile uint32_t DNR;
    volatile uint32_t RESERVED0;
    volatile uint32_t FIFO;
} I2C_TypeDef;

typedef struct {
    volatile uint32_t CR1;
    volatile uint32_t CR2;
    volatile uint32_t SMCR;
    volatile uint32_t DIER;
    volatile uint32_t SR;
    volatile uint32_t EGR;
    volatile uint32_t CCMR1;
    volatile uint32_t CCMR2;
    volatile uint32_t CCER;
    volatile uint32_t CNT;
    volatile uint32_t PSC;
    volatile uint32_t ARR;
    volatile uint32_t RCR;
    volatile uint32_t CCR1;
    volatile uint32_t CCR2;
    volatile uint32_t CCR3;
    volatile uint32_t CCR4;
} GPTIM_TypeDef;

typedef struct {
    volatile uint32_t CR1;
    volatile uint32_t CR2;
    volatile uint32_t SMCR;
    volatile uint32_t DIER;
    volatile uint32_t SR;
    volatile uint32_t EGR;
    volatile uint32_t RESERVED0[3];
    volatile uint32_t CNT;
    volatile uint32_t PSC;
    volatile uint32_t ARR;
} BTIM_TypeDef;

typedef struct {
    volatile uint32_t RESERVED0[23];
    volatile uint32_t PERI_LDO;
    volatile uint32_t RESERVED1[2];
    volatile uint32_t HXT_CR1;
} PMUC_TypeDef;

#define HPSYS_RCC      ((HPSYS_RCC_TypeDef *)HPSYS_RCC_BASE)
#define HPSYS_PINMUX   ((HPSYS_PINMUX_TypeDef *)HPSYS_PINMUX_BASE)
#define USART1         ((USART_TypeDef *)USART1_BASE)
#define USART2         ((USART_TypeDef *)USART2_BASE)
#define USART3         ((USART_TypeDef *)USART3_BASE)
#define GPTIM1         ((GPTIM_TypeDef *)GPTIM1_BASE)
#define BTIM1          ((BTIM_TypeDef *)BTIM1_BASE)
#define SPI1           ((SPI_TypeDef *)SPI1_BASE)
#define SPI2           ((SPI_TypeDef *)SPI2_BASE)
#define I2C1           ((I2C_TypeDef *)I2C1_BASE)
#define I2C2           ((I2C_TypeDef *)I2C2_BASE)
#define I2C3           ((I2C_TypeDef *)I2C3_BASE)
#define I2C4           ((I2C_TypeDef *)I2C4_BASE)
#define HPSYS_GPIO     ((HPSYS_GPIO_TypeDef *)HPSYS_GPIO_BASE)
#define GPTIM2         ((GPTIM_TypeDef *)GPTIM2_BASE)
#define BTIM2          ((BTIM_TypeDef *)BTIM2_BASE)
#define PMUC           ((PMUC_TypeDef *)PMUC_BASE)

#define hwp_hpsys_rcc  HPSYS_RCC
#define hwp_pinmux1    HPSYS_PINMUX
#define hwp_gpio1      HPSYS_GPIO
#define hwp_pmuc       PMUC

#ifdef __cplusplus
}
#endif
