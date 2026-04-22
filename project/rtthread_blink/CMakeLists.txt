add_executable(rtthread_blink
    ${RTTHREAD_SOURCES}
    board.c
    main.c
    startup.c
    system.c
)

target_include_directories(rtthread_blink PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(rtthread_blink PRIVATE rtthread_kernel)
target_link_options(rtthread_blink PRIVATE -T${CMAKE_CURRENT_SOURCE_DIR}/link.ld)

if(ENABLE_WARNINGS)
    target_compile_options(rtthread_blink PRIVATE
        -Wall -Wextra -Wpedantic -Wno-unused-parameter
        ${RTTHREAD_WARN_SUPPRESS}
    )
endif()

add_firmware(rtthread_blink)
