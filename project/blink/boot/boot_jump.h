#pragma once

#include <stdint.h>

int boot_app_vector_is_valid(uint32_t app_base);
void boot_jump_to_image(uint32_t image_base);
