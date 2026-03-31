if(NOT DEFINED SF32_IMAGE_FILE OR SF32_IMAGE_FILE STREQUAL "")
    message(FATAL_ERROR "SF32_IMAGE_FILE is empty. Pass the image file path to flash.")
endif()

execute_process(
    COMMAND powershell -NoProfile -Command
            "$port = Read-Host 'Enter serial port'; if ([string]::IsNullOrWhiteSpace($port)) { throw 'Serial port is empty.' }; & '${SF32_SFTOOL}' -c '${SF32_CHIP}' -p $port write_flash '${SF32_IMAGE_FILE}'"
    COMMAND_ERROR_IS_FATAL ANY
)
