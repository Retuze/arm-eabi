# Blink build

This project builds the application image (`firmware`) with CMake, Clang/LLVM, and `sftool`.

The bootloader has been split into its own standalone project at `project/blink_bootloader`.

## Configure

```powershell
cd project\blink
cmake --preset clang
```

## Build

Build the application:

```powershell
cd project\blink
cmake --build --preset firmware
```

Outputs:

- `build/clang-ninja/firmware.elf`
- `build/clang-ninja/firmware.bin`
- `build/clang-ninja/firmware.hex`
- `build/clang-ninja/firmware.map`

## Flash

Flash the application:

```powershell
cd project\blink
cmake --build --preset download
```

When the flash target runs, it will prompt for the serial port in the terminal.

Equivalent `sftool` command:

```powershell
..\..\partfrom\SF32LB52x\tools\sftool.exe -c SF32LB52 -p <PORT> write_flash build\clang-ninja\firmware.elf
```

For `elf` images in this repository, the burn command does not need an extra `@地址`. The image layout is already described by the linked `elf`.

## Notes

- The application default flash origin is `0x12020000`.
- The matching bootloader project lives in `project/blink_bootloader`.
