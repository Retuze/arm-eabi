# platform — arch flags, BSP headers, HAL + LL peripheral drivers

add_library(platform STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/bsp/SF32LB52-DevKit-Nano/board.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/hal/hal_afio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/hal/hal_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/hal/hal_pwm.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/hal/hal_uart.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/ll/ll_atim.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/ll/ll_dwt.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/ll/ll_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/ll/ll_nvic.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/ll/ll_pinmux.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/ll/ll_rcc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/ll/ll_rtt.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/ll/ll_uart.c
)
target_compile_options(platform PUBLIC
    --target=arm-none-eabi
    -mcpu=cortex-m33
    -mfpu=fpv5-sp-d16
    -mfloat-abi=hard
    -mthumb
)
target_include_directories(platform PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/bsp
    ${CMAKE_CURRENT_SOURCE_DIR}/bsp/SF32LB52-DevKit-Nano
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/hal
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/ll
    ${CMAKE_CURRENT_SOURCE_DIR}/drivers/soc
)
target_include_directories(platform PRIVATE
    ${CMAKE_SOURCE_DIR}/common/bit-bang
    ${CMAKE_SOURCE_DIR}/common/lcd
)

if(ENABLE_WARNINGS)
    target_compile_options(platform PRIVATE -Wall -Wextra -Wpedantic)
endif()
