# SF32LB52 Flashing Guide

This repository contains several SF32LB52 projects and artifacts. Their flash flow now follows the same rules:

- for `elf` images, do not append `@地址` to `write_flash`
- the serial port is entered when the flash command runs, not preconfigured in CMake

## General Rule

For the current `elf` images in this repository, the image already contains its link layout information.

Use:

```powershell
partfrom\SF32LB52x\tools\sftool.exe -c SF32LB52 -p <PORT> write_flash firmware.elf
```

Do not append an address suffix such as `@0x12020000` to an `elf` image.

## Projects

### `project/blink`

- Build application: `cmake --build --preset blink`
- Build bootloader: `cmake --build --preset blink_boot`
- Flash application: `cmake --build --preset blink_flash`
- Flash bootloader: `cmake --build --preset blink_boot_flash`

Both flash targets will prompt for the serial port in the terminal.

### `project/test`

- Build application: `cmake --build --preset test`
- Flash application: `cmake --build --preset test_flash`

The flash target will prompt for the serial port in the terminal.

`test` is an application image used with the SDK bootloader, not a bare bootloader image.

### `project/firmware`

This directory contains SDK-built artifacts rather than a local CMake project.

Typical images:

- `project/firmware/ftab/ftab.elf`
- `project/firmware/bootloader/bootloader.elf`
- `project/firmware/main.elf`

Typical manual flash commands:

```powershell
partfrom\SF32LB52x\tools\sftool.exe -c SF32LB52 -p <PORT> write_flash project\firmware\ftab\ftab.elf
partfrom\SF32LB52x\tools\sftool.exe -c SF32LB52 -p <PORT> write_flash project\firmware\main.elf
```

For `bootloader.elf`, the final image organization should still be checked against the original SDK download scripts when needed.

## Notes

- `blink` and `test` now prompt for the serial port during the flash step.
- Repository documentation has been updated to remove `elf@地址` examples.
- Address layout is still important for linking and partition design, but it is no longer written on the `sftool write_flash` command line for `elf` files.
