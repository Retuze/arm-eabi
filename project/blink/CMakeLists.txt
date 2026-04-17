cmake_minimum_required(VERSION 3.24)
project(blink C ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(ENABLE_WARNINGS "Enable extra compiler warnings" ON)

set(REPO_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../..)
include(${REPO_ROOT}/CMakeLists.txt)

add_executable(blink
    main.c
    startup.c
    system.c
)

target_include_directories(blink PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(blink PRIVATE drivers ulibc common platform)
target_link_options(blink PRIVATE -T${CMAKE_CURRENT_SOURCE_DIR}/link.ld)

if(ENABLE_WARNINGS)
    target_compile_options(blink PRIVATE -Wall -Wextra -Wpedantic)
endif()

add_firmware(blink)
