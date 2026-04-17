cmake_minimum_required(VERSION 3.24)
project(lcd_test C ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(ENABLE_WARNINGS "Enable extra compiler warnings" ON)

set(REPO_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../..)
include(${REPO_ROOT}/CMakeLists.txt)

add_executable(lcd_test
    main.c
    startup.c
    system.c
)

target_include_directories(lcd_test PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(lcd_test PRIVATE drivers ulibc common platform)
target_link_options(lcd_test PRIVATE -T${CMAKE_CURRENT_SOURCE_DIR}/link.ld)

if(ENABLE_WARNINGS)
    target_compile_options(lcd_test PRIVATE -Wall -Wextra -Wpedantic)
endif()

add_firmware(lcd_test)
