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
# Picolibc / compiler-rt：按仓库 libc/ 布局显式头路径与 .a（不使用 --sysroot）
#
#   libc/<PICOLIBC_PREFIX>/include
#   libc/<PICOLIBC_PREFIX>/lib/<multilib>/libc.a
#   libc/builtin/<multilib>/libclang_rt.builtins-arm.a
#
# 假定 picolibc 以 Meson -Dposix-console=true 构建（stdin/out/err 在 libc 内）。
# ---------------------------------------------------------------------------
set(PICOLIBC_PREFIX "usr/local" CACHE STRING "picolibc 在 libc/ 下的相对路径（含 include/、lib/）")
set(PICOLIBC_MULTILIB_DIR "v8-m.main+fp" CACHE STRING
    "picolibc 与 compiler-rt 的 multilib 子目录名（与 -mcpu/-mfpu 一致）")

set(LIBC_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/libc/${PICOLIBC_PREFIX}")
if(NOT EXISTS "${LIBC_ROOT}/include")
    message(FATAL_ERROR "缺少 picolibc 头文件目录：\n  ${LIBC_ROOT}/include")
endif()

set(_LIBC_A "${LIBC_ROOT}/lib/${PICOLIBC_MULTILIB_DIR}/libc.a")
if(NOT EXISTS "${_LIBC_A}")
    message(FATAL_ERROR "缺少 libc.a：\n  ${_LIBC_A}")
endif()

set(_PICOLIBC_COMPILER_RT "${CMAKE_CURRENT_SOURCE_DIR}/libc/builtin/${PICOLIBC_MULTILIB_DIR}/libclang_rt.builtins-arm.a")
if(NOT EXISTS "${_PICOLIBC_COMPILER_RT}")
    message(FATAL_ERROR "缺少 compiler-rt：\n  ${_PICOLIBC_COMPILER_RT}")
endif()

add_library(picolibc_syscalls STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/common/picolibc_syscalls.c
)
target_include_directories(picolibc_syscalls SYSTEM PRIVATE "${LIBC_ROOT}/include")
target_link_libraries(picolibc_syscalls PRIVATE platform)

add_library(picolibc_rt INTERFACE)
target_include_directories(picolibc_rt SYSTEM INTERFACE "${LIBC_ROOT}/include")
target_link_libraries(picolibc_rt INTERFACE
    "${_LIBC_A}"
    picolibc_syscalls
    "${_PICOLIBC_COMPILER_RT}"
)

# ---------------------------------------------------------------------------
# common — platform-agnostic utilities (bit-bang drivers, log, etc.)
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
# Warnings
# ---------------------------------------------------------------------------
if(ENABLE_WARNINGS)
    target_compile_options(platform PRIVATE -Wall -Wextra -Wpedantic)
    target_compile_options(picolibc_syscalls PRIVATE -Wall -Wextra -Wpedantic)
    target_compile_options(common PRIVATE -Wall -Wextra -Wpedantic)
endif()

# ---------------------------------------------------------------------------
# Firmware projects
# ---------------------------------------------------------------------------
add_subdirectory(project/blink)
add_subdirectory(project/lcd_test)
