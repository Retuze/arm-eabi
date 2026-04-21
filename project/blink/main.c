#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "bsp.h"

int main(void)
{
    const uint32_t target_hclk_hz = 240000000UL;
    pinMode(31, OUTPUT);

    printf("blink start\n");
    rcc_set_system_hz(target_hclk_hz);
    printf("set 240MHz hz=%" PRIu32 "\n", rcc_get_system_hz());

    printf("u32=%" PRIu32 ", i32=%" PRId32 ", char=%c, bool=%d, ptr=%p, float=%f, double=%f\n",
           target_hclk_hz,
           (int32_t)-12345,
           'A',
           (int)true,
           (void *)&target_hclk_hz,
           (double)3.14159f,
           2.718281828);
    printf("%s %d %f %f\n", "end of print", 1234567890, 3.14159f, 2.718281828);

    /* 探测 picolibc malloc 是否要求 _sbrk 等链接符号 */
    {
        char *p = (char *)malloc(64U);
        if (p != NULL) {
            (void)snprintf(p, 64U, "malloc ok p=%p", (void *)p);
            printf("%s\n", p);
            free(p);
        } else {
            printf("malloc returned NULL\n");
        }
    }

    while (1) {
        digitalToggle(31);
        delay(500);
    }
}
