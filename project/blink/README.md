# Blink build

This project builds both the application image (`blink`) and a minimal second-stage bootloader (`blink_boot`) with CMake, Clang/LLVM, and `sftool`.

## Configure

```powershell
cd project\blink
cmake --preset clang-ninja
```

To override the image layout:

```powershell
cd project\blink
cmake --preset clang-ninja `
  -DSF32_BOOT_FLASH_ORIGIN=0x12010000 `
  -DSF32_FLASH_ORIGIN=0x12020000
```

## Build

Build the application:

```powershell
cd project\blink
cmake --build --preset blink
```

Build the bootloader:

```powershell
cd project\blink
cmake --build --preset blink_boot
```

Outputs:

- `build/clang-ninja/blink.elf`
- `build/clang-ninja/blink.bin`
- `build/clang-ninja/blink.hex`
- `build/clang-ninja/blink.map`
- `build/clang-ninja/blink_boot.elf`
- `build/clang-ninja/blink_boot.bin`
- `build/clang-ninja/blink_boot.hex`
- `build/clang-ninja/blink_boot.map`

## Startup Files

`blink_boot` is already linked with the same startup objects used by the application:

- `partfrom/SF32LB52x/soc/startup.c`
- `partfrom/SF32LB52x/soc/system.c`

So the current issue is not a missing startup file. `boot/main.c` is entered through `Reset_Handler` from `startup.c`, and the bootloader-specific memory layout is controlled by `boot/link.ld`.

## Flash

Flash the application:

```powershell
cd project\blink
cmake --build --preset blink_flash
```

When the flash target runs, it will prompt for the serial port in the terminal.

Equivalent `sftool` command:

```powershell
..\..\partfrom\SF32LB52x\tools\sftool.exe -c SF32LB52 -p <PORT> write_flash build\clang-ninja\blink.elf
```

Flash the bootloader:

```powershell
cd project\blink
cmake --build --preset blink_boot_flash
```

Equivalent `sftool` command:

```powershell
partfrom\SF32LB52x\tools\sftool.exe -c SF32LB52 -p <PORT> write_flash build\clang-ninja\blink_boot.elf
```

Recommended order on a blank board:

1. Program `blink_boot`.
2. Program `blink`.

For `elf` images in this repository, the burn command does not need an extra `@地址`. The image layout is already described by the linked `elf`.

## SDK Alignment Notes

Compared with the SDK bootloader example `example/boot_loader/project/butterflmicro`:

- The bootloader still follows the same two-stage idea: boot image stored in flash, loaded/executed with a dedicated boot linker script, then jumps to the application vector table.
- The simplified `blink_boot` keeps only the minimum path needed for bring-up: power on flash, set pinmux/clock, validate the app vector, then jump.
- The official SDK bootloader contains extra flash autodetect, security, DFU, and image table logic that is intentionally not pulled into `blink` yet.

## Notes

- The application default flash origin is `0x12020000`.
- The bootloader flash origin is `0x12010000`.
- The bootloader runtime layout remains `0x20020000` for code and `0x20040000` for data/stack, matching the constraints documented in `boot/BOOT_FLOW.md`.
