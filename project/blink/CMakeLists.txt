cmake_minimum_required(VERSION 3.24)

project(blink C ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(SF32_ENABLE_WARNINGS "Enable extra compiler warnings" ON)

set(SF32_CHIP "SF32LB52" CACHE STRING "Target chip name used by sftool")
set(SF32_BOARD "SF32LB52-DevKit-Nano" CACHE STRING "Target board name")
set(SF32_PROJECT_ROOT "${CMAKE_CURRENT_SOURCE_DIR}")
set(SF32_REPO_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/../..")
set(SF32_PART_ROOT "${SF32_REPO_ROOT}/partfrom/SF32LB52x")
set(SF32_BOARD_DIR "${SF32_PART_ROOT}/board/${SF32_BOARD}")
set(SF32_SOC_DIR "${SF32_PART_ROOT}/soc")
set(SF32_BSP_DIR "${SF32_PART_ROOT}/bsp")
set(SF32_HAL_DIR "${SF32_PART_ROOT}/hal")
set(SF32_SDK_DIR "${SF32_PART_ROOT}/docs/SDK/sifli-sdk")
set(SF32_SDK_CMSIS_DIR "${SF32_SDK_DIR}/drivers/cmsis")
set(SF32_SDK_CMSIS_SOC_DIR "${SF32_SDK_CMSIS_DIR}/sf32lb52x")
set(SF32_SDK_CMSIS_INC_DIR "${SF32_SDK_CMSIS_DIR}/Include")
set(SF32_SDK_EXT_CMSIS_INC_DIR "${SF32_SDK_DIR}/external/CMSIS/Include")
set(SF32_TOOL_DIR "${SF32_PART_ROOT}/tools")
set(SF32_SFTOOL_DEFAULT "${SF32_TOOL_DIR}/sftool.exe")
set(SF32_SFTOOL "$ENV{SF32_SFTOOL}" CACHE FILEPATH "Path to sftool executable")
if(NOT SF32_SFTOOL)
    set(SF32_SFTOOL "${SF32_SFTOOL_DEFAULT}" CACHE FILEPATH "Path to sftool executable" FORCE)
endif()
set(SF32_LINKER_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/link.ld")
set(SF32_CLANG_BUILTINS_LIB "${SF32_SOC_DIR}/libclang_rt.builtins-arm.a")

add_library(sf32_platform INTERFACE)
target_include_directories(sf32_platform INTERFACE
    ${SF32_HAL_DIR}
    ${SF32_BOARD_DIR}
    ${SF32_SOC_DIR}
    ${SF32_BSP_DIR}/bsp_afio
    ${SF32_BSP_DIR}/bsp_gpio
    ${SF32_BSP_DIR}/bsp_dwt
    ${SF32_BSP_DIR}/bsp_nvic
    ${SF32_BSP_DIR}/bsp_rcc
    ${SF32_BSP_DIR}/bsp_uart
    ${SF32_SDK_CMSIS_SOC_DIR}
    ${SF32_SDK_CMSIS_INC_DIR}
    ${SF32_SDK_EXT_CMSIS_INC_DIR}
)
target_compile_options(sf32_platform INTERFACE
    --target=arm-none-eabi
    -mcpu=cortex-m33
    -mfpu=fpv5-sp-d16
    -mfloat-abi=hard
    -mthumb
)
target_compile_definitions(sf32_platform INTERFACE
    SOC_BF0_HCPU
    SF32LB52X
)

add_library(sf32_startup OBJECT
    ${SF32_SOC_DIR}/startup.c
)
target_link_libraries(sf32_startup PUBLIC sf32_platform)

add_library(sf32_bsp STATIC
    ${SF32_BSP_DIR}/bsp_afio/bsp_afio.c
    ${SF32_BSP_DIR}/bsp_dwt/bsp_dwt.c
    ${SF32_BSP_DIR}/bsp_gpio/bsp_gpio.c
    ${SF32_BSP_DIR}/bsp_nvic/bsp_nvic.c
    ${SF32_BSP_DIR}/bsp_rcc/bsp_rcc.c
    ${SF32_BSP_DIR}/bsp_uart/bsp_uart.c
)
target_link_libraries(sf32_bsp PUBLIC sf32_platform)

if(SF32_ENABLE_WARNINGS)
    target_compile_options(sf32_startup PRIVATE -Wall -Wextra -Wpedantic)
    target_compile_options(sf32_bsp PRIVATE -Wall -Wextra -Wpedantic)
endif()

add_executable(firmware
    main.c
    $<TARGET_OBJECTS:sf32_startup>
)

set_target_properties(firmware PROPERTIES SUFFIX ".elf")

target_link_libraries(firmware PRIVATE
    sf32_bsp
    sf32_platform
    ${SF32_CLANG_BUILTINS_LIB}
)

if(SF32_ENABLE_WARNINGS)
    target_compile_options(firmware PRIVATE -Wall -Wextra -Wpedantic)
endif()

target_link_options(firmware PRIVATE
    --target=arm-none-eabi
    -mcpu=cortex-m33
    -mfpu=fpv5-sp-d16
    -mfloat-abi=hard
    -mthumb
    -T${SF32_LINKER_SCRIPT}
    -nostdlib
    -Wl,--gc-sections
    -Wl,--build-id=none
    -Wl,-Map,$<TARGET_FILE_DIR:firmware>/firmware.map
)

set(FIRMWARE_BIN ${CMAKE_CURRENT_BINARY_DIR}/firmware.bin)
set(FIRMWARE_HEX ${CMAKE_CURRENT_BINARY_DIR}/firmware.hex)

add_custom_command(
    TARGET firmware POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:firmware> ${FIRMWARE_BIN}
    COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:firmware> ${FIRMWARE_HEX}
    COMMAND ${CMAKE_SIZE} --format=berkeley $<TARGET_FILE:firmware>
    BYPRODUCTS ${FIRMWARE_BIN} ${FIRMWARE_HEX}
    VERBATIM
)

if(EXISTS "${SF32_SFTOOL}")
    add_custom_target(download
        COMMAND ${CMAKE_COMMAND}
            -DSF32_SFTOOL=${SF32_SFTOOL}
            -DSF32_CHIP=${SF32_CHIP}
            -DSF32_IMAGE_FILE=$<TARGET_FILE:firmware>
            -P ${CMAKE_CURRENT_SOURCE_DIR}/flash.cmake
        DEPENDS firmware
        USES_TERMINAL
        VERBATIM
    )
endif()
