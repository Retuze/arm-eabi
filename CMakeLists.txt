# Shared platform definitions — included by each project's CMakeLists.txt
# Usage: set(REPO_ROOT ...) then include(${REPO_ROOT}/CMakeLists.txt)

set(PLATFORM_DIR ${REPO_ROOT}/platform/SF32LB52x)

include(${REPO_ROOT}/cmake/firmware.cmake)

# ---------------------------------------------------------------------------
# platform — INTERFACE library carrying arch flags + include paths
# ---------------------------------------------------------------------------
add_library(platform INTERFACE)
target_compile_options(platform INTERFACE
    --target=arm-none-eabi
    -mcpu=cortex-m33
    -mfpu=fpv5-sp-d16
    -mfloat-abi=hard
    -mthumb
)
target_include_directories(platform INTERFACE
    ${PLATFORM_DIR}/bsp
    ${PLATFORM_DIR}/bsp/SF32LB52-DevKit-Nano
    ${PLATFORM_DIR}/drivers/hal
    ${PLATFORM_DIR}/drivers/ll
    ${PLATFORM_DIR}/drivers/soc
)

# ---------------------------------------------------------------------------
# drivers — HAL + LL peripheral drivers
# ---------------------------------------------------------------------------
add_library(drivers STATIC
    ${PLATFORM_DIR}/drivers/hal/hal_afio.c
    ${PLATFORM_DIR}/drivers/hal/hal_gpio.c
    ${PLATFORM_DIR}/drivers/hal/hal_uart.c
    ${PLATFORM_DIR}/drivers/ll/ll_dwt.c
    ${PLATFORM_DIR}/drivers/ll/ll_nvic.c
    ${PLATFORM_DIR}/drivers/ll/ll_rcc.c
    ${PLATFORM_DIR}/drivers/ll/ll_rtt.c
)
target_link_libraries(drivers PUBLIC platform)

# ---------------------------------------------------------------------------
# ulibc — micro libc (freestanding printf, memset/memcpy, compiler builtins)
# ---------------------------------------------------------------------------
add_library(ulibc STATIC
    ${REPO_ROOT}/ulibc/src/print.c
    ${REPO_ROOT}/ulibc/src/ulibc.c
)
target_include_directories(ulibc
    PUBLIC  ${REPO_ROOT}/ulibc/include
    PRIVATE ${REPO_ROOT}/ulibc/src
)
target_link_libraries(ulibc
    PUBLIC platform
    PUBLIC ${REPO_ROOT}/ulibc/builtin/v8-m.main+fp/libclang_rt.builtins-arm.a
)

# ---------------------------------------------------------------------------
# common — platform-agnostic utilities (bit-bang drivers, log, etc.)
# ---------------------------------------------------------------------------
add_library(common STATIC
    ${REPO_ROOT}/common/bit-bang/qspi/bb_qspi.c
    ${REPO_ROOT}/common/bit-bang/spi/bb_spi.c
    ${REPO_ROOT}/common/bit-bang/i2c/bb_i2c.c
    ${REPO_ROOT}/common/bit-bang/uart/bb_uart.c
)
target_include_directories(common
    PUBLIC ${REPO_ROOT}/common
    PUBLIC ${REPO_ROOT}/common/bit-bang
)
target_link_libraries(common PUBLIC platform)

# ---------------------------------------------------------------------------
# Warnings (applied to all libraries when ENABLE_WARNINGS is ON)
# ---------------------------------------------------------------------------
if(ENABLE_WARNINGS)
    target_compile_options(drivers PRIVATE -Wall -Wextra -Wpedantic)
    target_compile_options(ulibc   PRIVATE -Wall -Wextra -Wpedantic)
    target_compile_options(common  PRIVATE -Wall -Wextra -Wpedantic)
endif()
