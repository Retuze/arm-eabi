set(LCD_PANEL "CO5300" CACHE STRING "lcd_test panel: CO5300 (AMOLED QSPI) or NV3030B (TFT QSPI)")
set_property(CACHE LCD_PANEL PROPERTY STRINGS CO5300 NV3030B)

add_executable(lcd_test
    main.c
    startup.c
    system.c
)

if(LCD_PANEL STREQUAL "CO5300")
    target_sources(lcd_test PRIVATE ${CMAKE_SOURCE_DIR}/common/lcd/panel/co5300_oled.c)
    target_compile_definitions(lcd_test PRIVATE LCD_PANEL_CO5300)
elseif(LCD_PANEL STREQUAL "NV3030B")
    target_sources(lcd_test PRIVATE ${CMAKE_SOURCE_DIR}/common/lcd/panel/nv3030b_tft.c)
    target_compile_definitions(lcd_test PRIVATE LCD_PANEL_NV3030B)
else()
    message(FATAL_ERROR "Unknown LCD_PANEL=\"${LCD_PANEL}\" (use CO5300 or NV3030B)")
endif()

target_include_directories(lcd_test PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(lcd_test PRIVATE platform picolibc_rt common)
target_link_options(lcd_test PRIVATE -T${CMAKE_CURRENT_SOURCE_DIR}/link.ld)

if(ENABLE_WARNINGS)
    target_compile_options(lcd_test PRIVATE -Wall -Wextra -Wpedantic)
endif()

add_firmware(lcd_test)
