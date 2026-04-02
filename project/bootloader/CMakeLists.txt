cmake_minimum_required(VERSION 3.24)

project(bootloader C ASM)

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
set(SF32_PUBLIC_BSP_DIR "${SF32_REPO_ROOT}/bsp")
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

add_library(sf32_platform INTERFACE)
target_include_directories(sf32_platform INTERFACE
    ${SF32_PUBLIC_BSP_DIR}
    ${SF32_BOARD_DIR}
    ${SF32_SOC_DIR}
    ${SF32_SDK_CMSIS_SOC_DIR}
    ${SF32_SDK_CMSIS_INC_DIR}
    ${SF32_SDK_EXT_CMSIS_INC_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
)
target_compile_options(sf32_platform INTERFACE
    --target=arm-none-eabi
    -mcpu=cortex-m33
    -mthumb
)
target_compile_definitions(sf32_platform INTERFACE
    SOC_BF0_HCPU
    SF32LB52X
)

add_library(sf32_startup OBJECT
    ${SF32_SOC_DIR}/startup.c
    ${SF32_SOC_DIR}/system.c
)
target_link_libraries(sf32_startup PUBLIC sf32_platform)

add_library(sf32_bsp STATIC
    ${SF32_BSP_DIR}/afio.c
    ${SF32_BSP_DIR}/gpio.c
    ${SF32_BSP_DIR}/nvic.c
    ${SF32_BSP_DIR}/rcc.c
    ${SF32_BSP_DIR}/uart.c
    ${SF32_BSP_DIR}/spi.c
    ${SF32_BSP_DIR}/i2c.c
    ${SF32_BSP_DIR}/gptim.c
)
target_link_libraries(sf32_bsp PUBLIC sf32_platform)

if(SF32_ENABLE_WARNINGS)
    target_compile_options(sf32_startup PRIVATE -Wall -Wextra -Wpedantic)
    target_compile_options(sf32_bsp PRIVATE -Wall -Wextra -Wpedantic)
endif()

add_executable(bootloader
    boot_board.c
    boot_jump.c
    main.c
    $<TARGET_OBJECTS:sf32_startup>
)

set_target_properties(bootloader PROPERTIES SUFFIX ".elf")

target_link_libraries(bootloader PRIVATE sf32_bsp sf32_platform)

if(SF32_ENABLE_WARNINGS)
    target_compile_options(bootloader PRIVATE -Wall -Wextra -Wpedantic)
endif()

target_link_options(bootloader PRIVATE
    --target=arm-none-eabi
    -mcpu=cortex-m33
    -mthumb
    -T${SF32_LINKER_SCRIPT}
    -nostdlib
    -Wl,--gc-sections
    -Wl,--build-id=none
    -Wl,-Map,$<TARGET_FILE_DIR:bootloader>/bootloader.map
)

set(BOOTLOADER_BIN ${CMAKE_CURRENT_BINARY_DIR}/bootloader.bin)
set(BOOTLOADER_HEX ${CMAKE_CURRENT_BINARY_DIR}/bootloader.hex)

add_custom_command(
    TARGET bootloader POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:bootloader> ${BOOTLOADER_BIN}
    COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:bootloader> ${BOOTLOADER_HEX}
    COMMAND ${CMAKE_SIZE} --format=berkeley $<TARGET_FILE:bootloader>
    BYPRODUCTS ${BOOTLOADER_BIN} ${BOOTLOADER_HEX}
    VERBATIM
)

if(EXISTS "${SF32_SFTOOL}")
    add_custom_target(download
        COMMAND ${CMAKE_COMMAND}
            -DSF32_SFTOOL=${SF32_SFTOOL}
            -DSF32_CHIP=${SF32_CHIP}
            -DSF32_IMAGE_FILE=$<TARGET_FILE:bootloader>
            -P ${CMAKE_CURRENT_SOURCE_DIR}/flash.cmake
        DEPENDS bootloader
        USES_TERMINAL
        VERBATIM
    )
endif()
