# Test

`project/test` is a standalone minimal application project that builds an application image intended to be jumped to by the SDK bootloader.

It is not a bare-metal image placed at the bootloader slot. The default application address is still `0x12020000`.

## Purpose

This project provides a smaller and more direct reference than `blink`, mainly for:

- validating the build, link, and flash flow of a minimal application image
- validating the shortest startup chain built from `startup.s + link.ld + main.c + gpio.c`
- acting as a comparison target when debugging `blink`

## Layout

- [main.c](/d:/eabi-arm/arm-eabi/project/test/main.c)
  application entry, including `SystemInit`, `SysTick_Handler`, delay logic, and the main loop
- [startup.s](/d:/eabi-arm/arm-eabi/project/test/startup.s)
  startup assembly, vector table, `Reset_Handler`, `.data` copy, and `.bss` zeroing
- [link.ld](/d:/eabi-arm/arm-eabi/project/test/link.ld)
  linker script defining Flash/RAM layout and section placement
- [gpio.c](/d:/eabi-arm/arm-eabi/project/test/gpio.c)
  minimal GPIO driver
- [gpio.h](/d:/eabi-arm/arm-eabi/project/test/gpio.h)
  GPIO API declarations
- [board.h](/d:/eabi-arm/arm-eabi/project/test/board.h)
  board pin definitions
- [CMakeLists.txt](/d:/eabi-arm/arm-eabi/project/test/CMakeLists.txt)
  build entry
- [CMakePresets.json](/d:/eabi-arm/arm-eabi/project/test/CMakePresets.json)
  presets for `clang-ninja`, `test`, and `test_flash`
- [flash.cmake](/d:/eabi-arm/arm-eabi/project/test/flash.cmake)
  invokes `sftool` and prompts for the serial port when flashing

## Build Environment

This project uses a local toolchain file:

- `project/test/cmake/toolchains/clang-arm-none-eabi.cmake`

Compiler path setup:

- preferred: add `clang`/`llvm-*` tools to `PATH`
- optional: set `LLVM_ROOT` to LLVM install root (`.../LLVM` or `.../LLVM/bin`)

Required tools:

- CMake 3.24 or newer
- Ninja
- Clang/LLVM ARM cross toolchain
- `partfrom/SF32LB52x/tools/sftool.exe`

## Build

Configure:

```powershell
cd project\test
cmake --preset clang-ninja
```

Build:

```powershell
cd project\test
cmake --build --preset test
```

Generated outputs:

- `build/clang-ninja/test.elf`
- `build/clang-ninja/test.bin`
- `build/clang-ninja/test.hex`
- `build/clang-ninja/test.map`

## Flash

Flash the application:

```powershell
cd project\test
cmake --build --preset test_flash
```

When the flash target runs, it will prompt for the serial port in the terminal.

Equivalent `sftool` command:

```powershell
partfrom\SF32LB52x\tools\sftool.exe -c SF32LB52 -p <PORT> write_flash build\clang-ninja\test.elf
```

For `elf` images in this repository, the burn command does not need `@地址`.

## Memory Layout

Current defaults are defined in [link.ld](/d:/eabi-arm/arm-eabi/project/test/link.ld):

- Flash origin: `0x12020000`
- Flash length: `0x00E00000`
- RAM origin: `0x20000000`
- RAM length: `0x00080000`

This layout matches the application image scenario used with the SDK bootloader.

## Startup Flow

Current startup chain:

1. bootloader jumps to the application vector table
2. `Reset_Handler` in [startup.s](/d:/eabi-arm/arm-eabi/project/test/startup.s) sets the stack pointer
3. `Reset_Handler` calls `SystemInit`
4. `.data` is copied using the copy table
5. `.bss` is zeroed using the zero table
6. `Reset_Handler` calls `entry`
7. [main.c](/d:/eabi-arm/arm-eabi/project/test/main.c) sets `VTOR`, initializes SysTick, and runs the LED loop

## Current Behavior

The current example:

- points `VTOR` to the application vector table in `SystemInit()`
- initializes SysTick for 1 ms ticks
- configures GPIO31 as output
- toggles GPIO31 in a loop

If the board LED is not connected to GPIO31, update [main.c](/d:/eabi-arm/arm-eabi/project/test/main.c) or [board.h](/d:/eabi-arm/arm-eabi/project/test/board.h).

## Relationship To blink

`test` is not meant to replace `blink`. It is a smaller comparison baseline. When debugging `blink`, useful comparison points include:

- startup file behavior
- vector table completeness
- `VTOR` setup
- `SystemInit` and SysTick assumptions
- GPIO initialization
- consistency between link layout and flash flow

## Common Commands

```powershell
cd project\test
cmake --preset clang-ninja
cmake --build --preset test
cmake --build --preset test_flash
```
