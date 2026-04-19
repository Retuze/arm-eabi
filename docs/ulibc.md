# ulibc 与标准头文件

本仓库的 **`ulibc`** 在裸机（`-ffreestanding`）下提供 **与 ISO C 接近** 的公共头文件，便于第三方代码（如 wasm3）和本工程应用 **直接写 `#include <stdio.h>`**，而不依赖 GNU Arm 工具链自带的 newlib 头路径。

## 头文件位置

均在 **`ulibc/include/`**（通过 `libulibc` 的 `INTERFACE` 包含目录自动传给所有链接了 `ulibc` 的目标）：

| 头文件 | 说明 |
|--------|------|
| `<stdio.h>` | `printf` / `fprintf` / `snprintf` / `fwrite` / `stdout` 等；底层写 **`ulibc_write()`** |
| `<stdlib.h>` | `malloc` / `free` / `calloc` / `realloc` / `abort` / `exit`，以及 `strtol` / `strtoul` / `strtoll` / `strtoull` / `strtod` / `strtof`（wasm3 / 命令行参数用） |
| `<string.h>` | `memcpy` / `memset` / `strlen` / `strcmp` 等（本仓库实现，见 `ulibc/src/string.c`） |
| `<assert.h>` | `assert`（未定义 `NDEBUG` 时触发 `bkpt` 死循环） |
| `<errno.h>` | `errno` 与常用宏（占位） |
| `<time.h>` | `clock()` 等（当前为桩实现） |
| `<inttypes.h>` | `PRI*` / `SCN*`（32 位 ARM 常用宽度） |
| `<math.h>` | `fabs` / `sqrt` / `ceil` / `floor` / `trunc` / `copysign` / `rint` 及 `isnan` 等（实现走 Clang `__builtin_*`，一般无需 `libm`） |
| `<ulibc_print.h>` | 可选：`print()` / `println()` `_Generic` 调试输出（实现见 `ulibc/src/format.c`） |

## 固件需要实现的内容

- **`ulibc_write(const char *data, size_t size)`**：通常映射到 RTT/UART（见各 `project/*/system.c`）。
- **`ulibc_read(char *buf, size_t count)`**：若不用可返回 `0`。

## 源文件布局（`ulibc/src/`）

| 文件 | 内容 |
|------|------|
| `string.c` | `string.h` 中的内存与字符串函数 |
| `format.c` | `printf` 格式化引擎与 `print_*` |
| `stdio.c` | `FILE` / `stdout` 等与对 `format.c` 的封装 |
| `heap.c` | `malloc` / `free` / `calloc` / `realloc` |
| `strto.c` | 数字解析（`strtod` 等） |
| `math.c` | `math.h` 中的浮点辅助函数 |
| `errno_stub.c` / `time_stub.c` / `assert_fail.c` | 桩或断言 |

## 堆大小

`malloc` 使用静态池，默认 **`256 * 1024`** 字节，可在编译前定义 **`ULIBC_HEAP_SIZE`** 覆盖（见 `ulibc/src/heap.c`）。
