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
    ${PLATFORM_DIR}/bsp/SF32LB52-DevKit-Nano/board.c
    ${PLATFORM_DIR}/drivers/hal/hal_afio.c
    ${PLATFORM_DIR}/drivers/hal/hal_gpio.c
    ${PLATFORM_DIR}/drivers/hal/hal_pwm.c
    ${PLATFORM_DIR}/drivers/hal/hal_uart.c
    ${PLATFORM_DIR}/drivers/ll/ll_atim.c
    ${PLATFORM_DIR}/drivers/ll/ll_dwt.c
    ${PLATFORM_DIR}/drivers/ll/ll_gpio.c
    ${PLATFORM_DIR}/drivers/ll/ll_nvic.c
    ${PLATFORM_DIR}/drivers/ll/ll_pinmux.c
    ${PLATFORM_DIR}/drivers/ll/ll_rcc.c
    ${PLATFORM_DIR}/drivers/ll/ll_rtt.c
    ${PLATFORM_DIR}/drivers/ll/ll_uart.c
)
target_compile_options(platform PUBLIC
    --target=arm-none-eabi
    -mcpu=cortex-m33
    -mfpu=fpv5-sp-d16
    -mfloat-abi=hard
    -mthumb
)
target_include_directories(platform PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/common/bit-bang
    ${CMAKE_CURRENT_SOURCE_DIR}/common/lcd
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

add_library(picolibc_rt INTERFACE)
target_include_directories(picolibc_rt SYSTEM INTERFACE "${LIBC_ROOT}/include")
target_link_libraries(picolibc_rt INTERFACE
    "${_LIBC_A}"
    "${_PICOLIBC_COMPILER_RT}"
)

# ---------------------------------------------------------------------------
# RT-Thread kernel — INTERFACE library (sources compiled per-project so each
# firmware target can provide its own rtconfig.h)
# ---------------------------------------------------------------------------
set(RTTHREAD_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/rt-thread)

set(RTTHREAD_SOURCES
    ${RTTHREAD_DIR}/src/clock.c
    ${RTTHREAD_DIR}/src/components.c
    ${RTTHREAD_DIR}/src/cpu_up.c
    ${RTTHREAD_DIR}/src/defunct.c
    ${RTTHREAD_DIR}/src/idle.c
    ${RTTHREAD_DIR}/src/ipc.c
    ${RTTHREAD_DIR}/src/irq.c
    ${RTTHREAD_DIR}/src/kservice.c
    ${RTTHREAD_DIR}/src/mem.c
    ${RTTHREAD_DIR}/src/mempool.c
    ${RTTHREAD_DIR}/src/object.c
    ${RTTHREAD_DIR}/src/scheduler_comm.c
    ${RTTHREAD_DIR}/src/scheduler_up.c
    ${RTTHREAD_DIR}/src/thread.c
    ${RTTHREAD_DIR}/src/timer.c
    ${RTTHREAD_DIR}/src/klibc/kstdio.c
    ${RTTHREAD_DIR}/src/klibc/kstring.c
    ${RTTHREAD_DIR}/src/klibc/kerrno.c
    ${RTTHREAD_DIR}/src/klibc/rt_vsnprintf_tiny.c
    ${RTTHREAD_DIR}/libcpu/arm/cortex-m33/cpuport.c
    ${RTTHREAD_DIR}/libcpu/arm/cortex-m33/context_gcc.S
    ${RTTHREAD_DIR}/libcpu/arm/cortex-m33/trustzone.c
)

add_library(rtthread_headers INTERFACE)
target_include_directories(rtthread_headers INTERFACE
    ${RTTHREAD_DIR}/include
    ${RTTHREAD_DIR}/include/klibc
    ${RTTHREAD_DIR}/libcpu/arm/cortex-m33
)
target_compile_definitions(rtthread_headers INTERFACE __RTTHREAD__ __RT_KERNEL_SOURCE__)
target_link_libraries(rtthread_headers INTERFACE platform picolibc_rt)

# ---------------------------------------------------------------------------
# common — platform-agnostic utilities (bit-bang drivers, log, etc.)
# ---------------------------------------------------------------------------
add_library(common STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/common/bit-bang/qspi/bb_qspi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/common/bit-bang/spi/bb_spi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/common/bit-bang/i2c/bb_i2c.c
    ${CMAKE_CURRENT_SOURCE_DIR}/common/bit-bang/uart/bb_uart.c
    ${CMAKE_CURRENT_SOURCE_DIR}/common/lcd/lcd.c
    ${CMAKE_CURRENT_SOURCE_DIR}/common/lcd/bus/lcd_qspi_bitbang.c
    ${CMAKE_CURRENT_SOURCE_DIR}/common/lcd/ic_driver/co5300_oled.c
    ${CMAKE_CURRENT_SOURCE_DIR}/common/lcd/ic_driver/nv3030b_tft.c
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
    target_compile_options(common PRIVATE -Wall -Wextra -Wpedantic)
endif()

# ---------------------------------------------------------------------------
# Firmware projects
# ---------------------------------------------------------------------------
add_subdirectory(project/blink)
if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/project/lcd_test/CMakeLists.txt)
    add_subdirectory(project/lcd_test)
endif()
