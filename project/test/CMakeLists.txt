cmake_minimum_required(VERSION 3.24)

project(test C ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(SF32_ENABLE_WARNINGS "Enable extra compiler warnings" ON)

set(SF32_CHIP "SF32LB52" CACHE STRING "Target chip name used by sftool")
set(SF32_REPO_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/../..")
set(SF32_SFTOOL_DEFAULT "${SF32_REPO_ROOT}/partfrom/SF32LB52x/tools/sftool.exe")
set(SF32_SFTOOL "$ENV{SF32_SFTOOL}" CACHE FILEPATH "Path to sftool executable")
if(NOT SF32_SFTOOL)
    set(SF32_SFTOOL "${SF32_SFTOOL_DEFAULT}" CACHE FILEPATH "Path to sftool executable" FORCE)
endif()
set(SF32_LINKER_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/link.ld)

add_library(test_platform INTERFACE)
target_include_directories(test_platform INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}
)

add_executable(firmware
    gpio.c
    main.c
    startup.s
)

# Build .s with clang's preprocessor path so CMake-generated dep/define flags
# are consumed instead of reported as unused.
set_source_files_properties(startup.s PROPERTIES COMPILE_OPTIONS "-x;assembler-with-cpp")

set_target_properties(firmware PROPERTIES SUFFIX ".elf")
target_link_libraries(firmware PRIVATE test_platform)

if(SF32_ENABLE_WARNINGS)
    target_compile_options(firmware PRIVATE -Wall -Wextra -Wpedantic)
endif()

target_link_options(firmware PRIVATE
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

if(EXISTS ${SF32_SFTOOL})
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
