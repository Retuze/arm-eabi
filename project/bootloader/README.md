# Blink bootloader build

This project builds the standalone second-stage bootloader image (`bootloader`) with CMake, Clang/LLVM, and `sftool`.

## Configure

```powershell
cd project\blink_bootloader
cmake --preset clang
```

## Build

```powershell
cd project\blink_bootloader
cmake --build --preset bootloader
```

Outputs:

- `build/clang-ninja/bootloader.elf`
- `build/clang-ninja/bootloader.bin`
- `build/clang-ninja/bootloader.hex`
- `build/clang-ninja/bootloader.map`

## Flash

```powershell
cd project\blink_bootloader
cmake --build --preset download
```

Equivalent `sftool` command:

```powershell
..\..\partfrom\SF32LB52x\tools\sftool.exe -c SF32LB52 -p <PORT> write_flash build\clang-ninja\bootloader.elf
```

Recommended order on a blank board:

1. Program `bootloader`.
2. Program `firmware` from `project/blink`.

For `elf` images in this repository, the burn command does not need an extra `@地址`. The image layout is already described by the linked `elf`.

## Notes

- The bootloader flash origin is `0x12010000`.
- The bootloader runtime layout remains `0x20020000` for code and `0x20040000` for data/stack.
- Design notes are in `BOOT_FLOW.md`.
