if(NOT EXISTS "${SF32_SFTOOL}")
    message(FATAL_ERROR "sftool not found: ${SF32_SFTOOL}")
endif()

if("${SF32_SFTOOL_PORT}" STREQUAL "")
    message(FATAL_ERROR "SF32_SFTOOL_PORT is empty. Pass -DSF32_SFTOOL_PORT=<serial-port> when configuring.")
endif()

if(NOT EXISTS "${LCD_TEST_ELF}")
    message(FATAL_ERROR "ELF does not exist: ${LCD_TEST_ELF}")
endif()

execute_process(
    COMMAND "${SF32_SFTOOL}" -c "${SF32_CHIP}" -p "${SF32_SFTOOL_PORT}" write_flash "${LCD_TEST_ELF}@${SF32_FLASH_ORIGIN}"
    RESULT_VARIABLE sf32_sftool_result
)

if(NOT sf32_sftool_result EQUAL 0)
    message(FATAL_ERROR "sftool failed with code ${sf32_sftool_result}")
endif()
