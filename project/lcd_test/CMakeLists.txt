add_executable(lcd_test
    main.c
    startup.c
    system.c
)

target_include_directories(lcd_test PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(lcd_test PRIVATE platform ulibc common)
target_link_options(lcd_test PRIVATE -T${CMAKE_CURRENT_SOURCE_DIR}/link.ld)

if(ENABLE_WARNINGS)
    target_compile_options(lcd_test PRIVATE -Wall -Wextra -Wpedantic)
endif()

add_firmware(lcd_test)
