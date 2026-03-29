# Blink build

This project now builds with modern CMake, Clang/LLVM, and `sftool`.

## Configure

```powershell
cd project\blink
cmake --preset clang-ninja
```

To override the default serial port or memory layout:

```powershell
cd project\blink
cmake --preset clang-ninja `
  -DSF32_SFTOOL_PORT=COM14 `
  -DSF32_FLASH_ORIGIN=0x12020000 `
  -DSF32_RAM_ORIGIN=0x20000000
```

## Build

```powershell
cd project\blink
cmake --build --preset blink
```

Outputs:

- `build/clang-ninja/blink.elf`
- `build/clang-ninja/blink.bin`
- `build/clang-ninja/blink.hex`
- `build/clang-ninja/blink.map`

## Flash

```powershell
cd project\blink
cmake --build --preset blink_flash
```

The flash target wraps:

```powershell
partfrom\sf32bl52\tools\sftool.exe -c SF32LB52 -p COM14 write_flash blink.elf@0x12020000
```

## Notes

- The default flash origin `0x12020000` is chosen to match common SF32LB52 application layouts.
- The default SysTick clock is `24 MHz`. Adjust `SF32_SYSTEM_CLOCK_HZ` if your board boots at a different core clock.
