cmake_minimum_required(VERSION 3.24)

project(lcd_test C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(SF32_ENABLE_WARNINGS "Enable extra compiler warnings" ON)

set(SF32_CHIP "SF32LB52" CACHE STRING "Target chip name used by sftool")
set(SF32_BOARD "SF32LB52-DevKit-Nano" CACHE STRING "Target board name")
set(SF32_SYSTEM_CLOCK_HZ "24000000" CACHE STRING "System clock used to program SysTick")
set(SF32_FLASH_ORIGIN "0x12020000" CACHE STRING "Application flash base address")
set(SF32_FLASH_LENGTH "0x00E00000" CACHE STRING "Application flash length")
set(SF32_RAM_ORIGIN "0x20000000" CACHE STRING "RAM base address")
set(SF32_RAM_LENGTH "0x00080000" CACHE STRING "RAM length")
set(SF32_STACK_SIZE "0x00004000" CACHE STRING "Stack size in bytes")
set(SF32_HEAP_SIZE "0x00000000" CACHE STRING "Heap size in bytes")
set(SF32_SFTOOL_PORT "" CACHE STRING "Serial port used by sftool, for example COM14")

set(SF32_PROJECT_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(SF32_REPO_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../..)
set(SF32_PART_ROOT ${SF32_REPO_ROOT}/partfrom/SF32LB52x)
set(SF32_BOARD_DIR ${SF32_PART_ROOT}/board/${SF32_BOARD})
set(SF32_SOC_DIR ${SF32_PART_ROOT}/soc)
set(SF32_BSP_DIR ${SF32_PART_ROOT}/bsp)
set(SF32_PUBLIC_BSP_DIR ${SF32_REPO_ROOT}/bsp)
set(SF32_TOOL_DIR ${SF32_PART_ROOT}/tools)
set(SF32_SFTOOL ${SF32_TOOL_DIR}/sftool.exe CACHE FILEPATH "Path to sftool executable")
set(SF32_LINKER_SCRIPT ${SF32_SOC_DIR}/link.ld)

add_library(sf32_platform INTERFACE)
target_include_directories(sf32_platform INTERFACE
    ${SF32_PUBLIC_BSP_DIR}
    ${SF32_BOARD_DIR}
    ${SF32_SOC_DIR}
)
target_compile_definitions(sf32_platform INTERFACE
    SF32_SYSTEM_CLOCK_HZ=${SF32_SYSTEM_CLOCK_HZ}
)

add_library(sf32_startup OBJECT
    ${SF32_SOC_DIR}/startup.c
    ${SF32_SOC_DIR}/system.c
)
target_link_libraries(sf32_startup PUBLIC sf32_platform)

add_library(sf32_bsp STATIC
    ${SF32_BSP_DIR}/gpio.c
    ${SF32_BSP_DIR}/qspi_gpio.c
    ${SF32_BSP_DIR}/lcd_driver.c
)
target_link_libraries(sf32_bsp PUBLIC sf32_platform)

if(SF32_ENABLE_WARNINGS)
    target_compile_options(sf32_startup PRIVATE -Wall -Wextra -Wpedantic)
    target_compile_options(sf32_bsp PRIVATE -Wall -Wextra -Wpedantic)
endif()

add_executable(lcd_test
    main.c
    $<TARGET_OBJECTS:sf32_startup>
)

set_target_properties(lcd_test PROPERTIES SUFFIX ".elf")

target_link_libraries(lcd_test PRIVATE sf32_bsp sf32_platform)

if(SF32_ENABLE_WARNINGS)
    target_compile_options(lcd_test PRIVATE -Wall -Wextra -Wpedantic)
endif()

target_link_options(lcd_test PRIVATE
    --target=arm-none-eabi
    -mcpu=cortex-m33
    -mthumb
    -fuse-ld=lld
    -T${SF32_LINKER_SCRIPT}
    -nostdlib
    -Wl,--gc-sections
    -Wl,--build-id=none
    -Wl,-Map,$<TARGET_FILE_DIR:lcd_test>/lcd_test.map
    -Wl,--defsym=__flash_origin__=${SF32_FLASH_ORIGIN}
    -Wl,--defsym=__flash_length__=${SF32_FLASH_LENGTH}
    -Wl,--defsym=__ram_origin__=${SF32_RAM_ORIGIN}
    -Wl,--defsym=__ram_length__=${SF32_RAM_LENGTH}
    -Wl,--defsym=__stack_size__=${SF32_STACK_SIZE}
    -Wl,--defsym=__heap_size__=${SF32_HEAP_SIZE}
)

set(LCD_TEST_BIN ${CMAKE_CURRENT_BINARY_DIR}/lcd_test.bin)
set(LCD_TEST_HEX ${CMAKE_CURRENT_BINARY_DIR}/lcd_test.hex)

add_custom_command(
    TARGET lcd_test POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:lcd_test> ${LCD_TEST_BIN}
    COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:lcd_test> ${LCD_TEST_HEX}
    COMMAND ${CMAKE_SIZE} --format=berkeley $<TARGET_FILE:lcd_test>
    BYPRODUCTS ${LCD_TEST_BIN} ${LCD_TEST_HEX}
    VERBATIM
)

if(EXISTS ${SF32_SFTOOL})
    add_custom_target(lcd_test_flash
        COMMAND ${CMAKE_COMMAND}
            -DSF32_SFTOOL=${SF32_SFTOOL}
            -DSF32_CHIP=${SF32_CHIP}
            -DSF32_SFTOOL_PORT=${SF32_SFTOOL_PORT}
            -DSF32_FLASH_ORIGIN=${SF32_FLASH_ORIGIN}
            -DLCD_TEST_ELF=$<TARGET_FILE:lcd_test>
            -P ${CMAKE_CURRENT_SOURCE_DIR}/flash.cmake
        DEPENDS lcd_test
        USES_TERMINAL
        VERBATIM
    )
endif()
