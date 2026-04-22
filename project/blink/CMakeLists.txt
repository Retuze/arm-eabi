add_executable(blink
    main.c
    startup.c
    system.c
)

target_include_directories(blink PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(blink PRIVATE platform picolibc)
target_link_options(blink PRIVATE -T${CMAKE_CURRENT_SOURCE_DIR}/link.ld)

if(ENABLE_WARNINGS)
    target_compile_options(blink PRIVATE -Wall -Wextra -Wpedantic -Wno-unused-parameter)
endif()

add_firmware(blink)
