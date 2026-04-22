# RT-Thread Nano kernel
#
# INTERFACE library: sources are compiled per-project so each firmware
# target can supply its own rtconfig.h via include path order.
#
# Consumers should:
#   1. Add ${RTTHREAD_SOURCES} to their own target's source list
#   2. Link against rtthread_kernel for headers, compile defs & transitive deps

set(RTTHREAD_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/clock.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/components.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/idle.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/ipc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/irq.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/kservice.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/mem.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/mempool.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/object.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/scheduler.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/thread.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/timer.c
    ${CMAKE_CURRENT_SOURCE_DIR}/libcpu/arm/cortex-m33/cpuport.c
    ${CMAKE_CURRENT_SOURCE_DIR}/libcpu/arm/cortex-m33/context_gcc.S
    ${CMAKE_CURRENT_SOURCE_DIR}/libcpu/arm/cortex-m33/trustzone.c
    PARENT_SCOPE
)

set(RTTHREAD_WARN_SUPPRESS
    -Wno-extra-semi -Wno-unused-parameter -Wno-sign-compare
    -Wno-pedantic -Wno-missing-field-initializers
    PARENT_SCOPE
)

add_library(rtthread_kernel INTERFACE)
target_include_directories(rtthread_kernel INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}/libcpu/arm/cortex-m33
)
target_compile_definitions(rtthread_kernel INTERFACE __RTTHREAD__ __RT_KERNEL_SOURCE__)
target_link_libraries(rtthread_kernel INTERFACE platform picolibc)
