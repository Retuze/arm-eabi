if(NOT DEFINED SF32_SFTOOL_PORT OR SF32_SFTOOL_PORT STREQUAL "")
    message(FATAL_ERROR "SF32_SFTOOL_PORT is empty. Reconfigure with -DSF32_SFTOOL_PORT=COM14 and build the flash target again.")
endif()

execute_process(
    COMMAND "${SF32_SFTOOL}" -c "${SF32_CHIP}" -p "${SF32_SFTOOL_PORT}" write_flash "${BLINK_ELF}@${SF32_FLASH_ORIGIN}"
    COMMAND_ERROR_IS_FATAL ANY
)
