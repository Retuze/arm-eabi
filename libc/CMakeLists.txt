# picolibc — C library (picolibc) + compiler-rt builtins

set(PICOLIBC_PREFIX "usr/local" CACHE STRING "picolibc 在 libc/ 下的相对路径（含 include/、lib/）")
set(PICOLIBC_MULTILIB_DIR "v8-m.main+fp" CACHE STRING
    "picolibc 与 compiler-rt 的 multilib 子目录名（与 -mcpu/-mfpu 一致）")

set(LIBC_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/${PICOLIBC_PREFIX}")
if(NOT EXISTS "${LIBC_ROOT}/include")
    message(FATAL_ERROR "缺少 picolibc 头文件目录：\n  ${LIBC_ROOT}/include")
endif()

set(_LIBC_A "${LIBC_ROOT}/lib/${PICOLIBC_MULTILIB_DIR}/libc.a")
if(NOT EXISTS "${_LIBC_A}")
    message(FATAL_ERROR "缺少 libc.a：\n  ${_LIBC_A}")
endif()

set(_PICOLIBC_COMPILER_RT "${CMAKE_CURRENT_SOURCE_DIR}/builtin/${PICOLIBC_MULTILIB_DIR}/libclang_rt.builtins-arm.a")
if(NOT EXISTS "${_PICOLIBC_COMPILER_RT}")
    message(FATAL_ERROR "缺少 compiler-rt：\n  ${_PICOLIBC_COMPILER_RT}")
endif()

add_library(picolibc INTERFACE)
target_include_directories(picolibc SYSTEM INTERFACE "${LIBC_ROOT}/include")
target_link_libraries(picolibc INTERFACE
    "${_LIBC_A}"
    "${_PICOLIBC_COMPILER_RT}"
)
