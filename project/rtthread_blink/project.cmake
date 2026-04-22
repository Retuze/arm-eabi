# project.cmake — RT-Thread LED blink project
#
# Available libraries (defined in cmake/libraries.cmake):
#   platform  — HAL/LL drivers, BSP
#   picolibc  — C library + compiler-rt
#   rtthread  — RT-Thread Nano kernel
#   common    — bit-bang drivers, LCD, utilities

set(PROJECT_LIBS
    rtthread
)
