set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(LLVM_ROOT "C:/tool/LLVM/bin" CACHE PATH "LLVM toolchain root")

set(CMAKE_C_COMPILER "${LLVM_ROOT}/clang.exe")
set(CMAKE_ASM_COMPILER "${LLVM_ROOT}/clang.exe")
set(CMAKE_C_COMPILER_TARGET arm-none-eabi)
set(CMAKE_ASM_COMPILER_TARGET arm-none-eabi)
set(CMAKE_AR "${LLVM_ROOT}/llvm-ar.exe")
set(CMAKE_RANLIB "${LLVM_ROOT}/llvm-ranlib.exe")
set(CMAKE_OBJCOPY "${LLVM_ROOT}/llvm-objcopy.exe" CACHE FILEPATH "llvm-objcopy path")
set(CMAKE_SIZE "${LLVM_ROOT}/llvm-size.exe" CACHE FILEPATH "llvm-size path")

set(SF32_COMMON_FLAGS_INIT "--target=arm-none-eabi -mcpu=cortex-m33 -mthumb -ffreestanding -fdata-sections -ffunction-sections -fno-builtin -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables")
set(CMAKE_C_FLAGS "${SF32_COMMON_FLAGS_INIT}" CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS "${SF32_COMMON_FLAGS_INIT}" CACHE STRING "" FORCE)
set(CMAKE_EXE_LINKER_FLAGS "--target=arm-none-eabi -mcpu=cortex-m33 -mthumb -fuse-ld=lld" CACHE STRING "" FORCE)
