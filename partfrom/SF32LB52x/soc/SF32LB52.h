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

#define SCB_VTOR            (*(volatile uint32_t *)0xE000ED08UL)
#define SCS_BASE            (0xE000E000UL)
#define SYSTICK_BASE        (SCS_BASE + 0x0010UL)
#define SYST_CSR            (*(volatile uint32_t *)(SYSTICK_BASE + 0x0UL))
#define SYST_RVR            (*(volatile uint32_t *)(SYSTICK_BASE + 0x4UL))
#define SYST_CVR            (*(volatile uint32_t *)(SYSTICK_BASE + 0x8UL))

uint32_t sf32_get_hclk_hz(void);
uint32_t millis(void);
void delay(uint32_t ms);

#ifdef __cplusplus
}
#endif
