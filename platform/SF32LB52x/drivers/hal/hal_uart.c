#include "hal_uart.h"
#include "ll_uart.h"

#include <stdint.h>

void uart_write_byte(uint8_t value)
{
    sf32lb52_uart1_write_byte(value);
}

void uart_wait_tc(void)
{
    sf32lb52_uart1_wait_tc();
}
