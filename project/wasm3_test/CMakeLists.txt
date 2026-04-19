add_executable(wasm3_test
    main.c
    startup.c
    system.c
)

target_include_directories(wasm3_test PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(wasm3_test PRIVATE platform ulibc m3)
target_link_options(wasm3_test PRIVATE -T${CMAKE_CURRENT_SOURCE_DIR}/link.ld)

if(ENABLE_WARNINGS)
    target_compile_options(wasm3_test PRIVATE -Wall -Wextra -Wpedantic)
endif()

add_firmware(wasm3_test)
