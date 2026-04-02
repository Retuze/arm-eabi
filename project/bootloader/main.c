#include "boot_board.h"
#include "boot_cfg.h"
#include "boot_jump.h"

int main(void)
{
    boot_board_init();

    if (!boot_app_vector_is_valid(APP_XIP_BASE)) {
        while (1) {
        }
    }

    boot_jump_to_image(APP_XIP_BASE);

    while (1) {
    }
}
