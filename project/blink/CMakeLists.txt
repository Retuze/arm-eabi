add_executable(blink
    main.c
    startup.c
    system.c
    ${RTTHREAD_SOURCES}
)

target_include_directories(blink PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(blink PRIVATE rtthread_headers common)
target_link_options(blink PRIVATE -T${CMAKE_CURRENT_SOURCE_DIR}/link.ld)

set_source_files_properties(${RTTHREAD_SOURCES} PROPERTIES
    COMPILE_FLAGS "-Wno-extra-semi -Wno-unused-parameter -Wno-sign-compare -Wno-pedantic -Wno-missing-field-initializers"
)

if(ENABLE_WARNINGS)
    target_compile_options(blink PRIVATE -Wall -Wextra -Wpedantic -Wno-unused-parameter)
endif()

add_firmware(blink)
