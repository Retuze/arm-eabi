#include "bsp_dwt.h"

#define DWT_CTRL_ADDR   (0xE0001000UL)
#define DWT_CYCCNT_ADDR (0xE0001004UL)
#define DEMCR_ADDR      (0xE000EDFCUL)

#define DWT_CTRL_CYCCNTENA (1UL << 0)
#define DEMCR_TRCENA       (1UL << 24)

#define DWT_CTRL   (*(volatile uint32_t *)DWT_CTRL_ADDR)
#define DWT_CYCCNT (*(volatile uint32_t *)DWT_CYCCNT_ADDR)
#define DEMCR      (*(volatile uint32_t *)DEMCR_ADDR)

int sf32_dwt_init(void)
{
    DEMCR |= DEMCR_TRCENA;
    DWT_CYCCNT = 0U;
    DWT_CTRL |= DWT_CTRL_CYCCNTENA;

    if ((DWT_CTRL & DWT_CTRL_CYCCNTENA) == 0U) {
        return -1;
    }

    return 0;
}

void sf32_dwt_reset_cycle(void)
{
    DWT_CYCCNT = 0U;
}

uint32_t sf32_dwt_get_cycle(void)
{
    return DWT_CYCCNT;
}
