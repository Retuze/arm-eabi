cmake_minimum_required(VERSION 3.24)

project(test C ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(SF32_ENABLE_WARNINGS "Enable extra compiler warnings" ON)

set(SF32_CHIP "SF32LB52" CACHE STRING "Target chip name used by sftool")
set(SF32_SYSTEM_CLOCK_HZ "24000000" CACHE STRING "System clock used to program SysTick")
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
target_compile_definitions(test_platform INTERFACE
    $<$<COMPILE_LANGUAGE:C>:SF32_SYSTEM_CLOCK_HZ=${SF32_SYSTEM_CLOCK_HZ}>
)

add_executable(test
    gpio.c
    main.c
    startup.s
)

# Build .s with clang's preprocessor path so CMake-generated dep/define flags
# are consumed instead of reported as unused.
set_source_files_properties(startup.s PROPERTIES COMPILE_OPTIONS "-x;assembler-with-cpp")

set_target_properties(test PROPERTIES SUFFIX ".elf")
target_link_libraries(test PRIVATE test_platform)

if(SF32_ENABLE_WARNINGS)
    target_compile_options(test PRIVATE -Wall -Wextra -Wpedantic)
endif()

target_link_options(test PRIVATE
    -T${SF32_LINKER_SCRIPT}
    -nostdlib
    -Wl,--gc-sections
    -Wl,--build-id=none
    -Wl,-Map,$<TARGET_FILE_DIR:test>/test.map
)

set(TEST_BIN ${CMAKE_CURRENT_BINARY_DIR}/test.bin)
set(TEST_HEX ${CMAKE_CURRENT_BINARY_DIR}/test.hex)

add_custom_command(
    TARGET test POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:test> ${TEST_BIN}
    COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:test> ${TEST_HEX}
    COMMAND ${CMAKE_SIZE} --format=berkeley $<TARGET_FILE:test>
    BYPRODUCTS ${TEST_BIN} ${TEST_HEX}
    VERBATIM
)

if(EXISTS ${SF32_SFTOOL})
    add_custom_target(test_flash
        COMMAND ${CMAKE_COMMAND}
            -DSF32_SFTOOL=${SF32_SFTOOL}
            -DSF32_CHIP=${SF32_CHIP}
            -DSF32_IMAGE_FILE=$<TARGET_FILE:test>
            -P ${CMAKE_CURRENT_SOURCE_DIR}/flash.cmake
        DEPENDS test
        USES_TERMINAL
        VERBATIM
    )
endif()
