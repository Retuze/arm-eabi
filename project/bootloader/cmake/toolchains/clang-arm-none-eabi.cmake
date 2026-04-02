set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(ARM_NONE_EABI_TARGET "arm-none-eabi" CACHE STRING "Cross compile target triple")
set(SF32_CPU "cortex-m33" CACHE STRING "Target CPU")

# Optional environment variable, for example:
#   LLVM_ROOT=C:/tool/LLVM
#   LLVM_ROOT=/opt/llvm
set(LLVM_ROOT "$ENV{LLVM_ROOT}" CACHE PATH "LLVM install root (optional)")
if(LLVM_ROOT)
    file(TO_CMAKE_PATH "${LLVM_ROOT}" LLVM_ROOT)
    set(_LLVM_HINT_DIRS "${LLVM_ROOT}" "${LLVM_ROOT}/bin")
endif()

find_program(CMAKE_C_COMPILER NAMES clang clang.exe HINTS ${_LLVM_HINT_DIRS} REQUIRED)
set(CMAKE_ASM_COMPILER "${CMAKE_C_COMPILER}" CACHE FILEPATH "ASM compiler" FORCE)

set(CMAKE_C_COMPILER_TARGET "${ARM_NONE_EABI_TARGET}")
set(CMAKE_ASM_COMPILER_TARGET "${ARM_NONE_EABI_TARGET}")

find_program(CMAKE_AR NAMES llvm-ar llvm-ar.exe HINTS ${_LLVM_HINT_DIRS} REQUIRED)
find_program(CMAKE_RANLIB NAMES llvm-ranlib llvm-ranlib.exe HINTS ${_LLVM_HINT_DIRS} REQUIRED)
find_program(CMAKE_OBJCOPY NAMES llvm-objcopy llvm-objcopy.exe HINTS ${_LLVM_HINT_DIRS} REQUIRED)
find_program(CMAKE_SIZE NAMES llvm-size llvm-size.exe HINTS ${_LLVM_HINT_DIRS} REQUIRED)

set(SF32_COMMON_FLAGS_INIT
    "--target=${ARM_NONE_EABI_TARGET} -mcpu=${SF32_CPU} -mthumb -ffreestanding -fdata-sections -ffunction-sections -fno-builtin -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables"
)
set(SF32_ASM_FLAGS_INIT "--target=${ARM_NONE_EABI_TARGET} -mcpu=${SF32_CPU} -mthumb")
set(CMAKE_C_FLAGS_INIT "${SF32_COMMON_FLAGS_INIT}")
set(CMAKE_ASM_FLAGS_INIT "${SF32_ASM_FLAGS_INIT}")
set(CMAKE_EXE_LINKER_FLAGS_INIT "--target=${ARM_NONE_EABI_TARGET} -mcpu=${SF32_CPU} -mthumb -fuse-ld=lld")
