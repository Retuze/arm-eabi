cmake_minimum_required(VERSION 3.24)
project(sf32lb52-sdk C ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(ENABLE_WARNINGS "Enable extra compiler warnings" ON)

set(PLATFORM_DIR ${CMAKE_CURRENT_SOURCE_DIR}/platform/SF32LB52x)

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/firmware.cmake)

# ---------------------------------------------------------------------------
# platform — arch flags, BSP headers, HAL + LL peripheral drivers
# ---------------------------------------------------------------------------
add_library(platform STATIC
    ${PLATFORM_DIR}/drivers/hal/hal_afio.c
    ${PLATFORM_DIR}/drivers/hal/hal_gpio.c
    ${PLATFORM_DIR}/drivers/hal/hal_uart.c
    ${PLATFORM_DIR}/drivers/ll/ll_dwt.c
    ${PLATFORM_DIR}/drivers/ll/ll_nvic.c
    ${PLATFORM_DIR}/drivers/ll/ll_rcc.c
    ${PLATFORM_DIR}/drivers/ll/ll_rtt.c
)
target_compile_options(platform PUBLIC
    --target=arm-none-eabi
    -mcpu=cortex-m33
    -mfpu=fpv5-sp-d16
    -mfloat-abi=hard
    -mthumb
)
target_include_directories(platform PUBLIC
    ${PLATFORM_DIR}/bsp
    ${PLATFORM_DIR}/bsp/SF32LB52-DevKit-Nano
    ${PLATFORM_DIR}/drivers/hal
    ${PLATFORM_DIR}/drivers/ll
    ${PLATFORM_DIR}/drivers/soc
)

# ---------------------------------------------------------------------------
# ulibc — micro libc (freestanding printf, memset/memcpy, compiler builtins)
# ---------------------------------------------------------------------------
add_library(ulibc STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/ulibc/src/print.c
    ${CMAKE_CURRENT_SOURCE_DIR}/ulibc/src/ulibc.c
)
target_include_directories(ulibc
    PUBLIC  ${CMAKE_CURRENT_SOURCE_DIR}/ulibc/include
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/ulibc/src
)
target_link_libraries(ulibc
    PUBLIC platform
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/ulibc/builtin/v8-m.main+fp/libclang_rt.builtins-arm.a
)

# ---------------------------------------------------------------------------
# common — platform-agnostic utilities (bit-bang drivers, log, etc.)
# Panel drivers live under common/lcd/panel/; each firmware picks one (see project/lcd_test/CMakeLists.txt).
# ---------------------------------------------------------------------------
add_library(common STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/common/bit-bang/qspi/bb_qspi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/common/bit-bang/spi/bb_spi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/common/bit-bang/i2c/bb_i2c.c
    ${CMAKE_CURRENT_SOURCE_DIR}/common/bit-bang/uart/bb_uart.c
    ${CMAKE_CURRENT_SOURCE_DIR}/common/lcd/lcd.c
)
target_include_directories(common
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/common
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/common/bit-bang
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/common/lcd
)
target_link_libraries(common PUBLIC platform)

# ---------------------------------------------------------------------------
# Warnings (applied to all libraries when ENABLE_WARNINGS is ON)
# ---------------------------------------------------------------------------
if(ENABLE_WARNINGS)
    target_compile_options(platform PRIVATE -Wall -Wextra -Wpedantic)
    target_compile_options(ulibc    PRIVATE -Wall -Wextra -Wpedantic)
    target_compile_options(common   PRIVATE -Wall -Wextra -Wpedantic)
endif()

# ---------------------------------------------------------------------------
# Projects
# ---------------------------------------------------------------------------
add_subdirectory(project/blink)
add_subdirectory(project/lcd_test)
