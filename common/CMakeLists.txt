# common — platform-agnostic utilities (bit-bang drivers, LCD, etc.)

add_library(common STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/bit-bang/qspi/bb_qspi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/bit-bang/spi/bb_spi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/bit-bang/i2c/bb_i2c.c
    ${CMAKE_CURRENT_SOURCE_DIR}/bit-bang/uart/bb_uart.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lcd/lcd.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lcd/bus/lcd_qspi_bitbang.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lcd/ic_driver/co5300_oled.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lcd/ic_driver/nv3030b_tft.c
)
target_include_directories(common
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/bit-bang
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/lcd
)
target_link_libraries(common PUBLIC platform)

if(ENABLE_WARNINGS)
    target_compile_options(common PRIVATE -Wall -Wextra -Wpedantic)
endif()
