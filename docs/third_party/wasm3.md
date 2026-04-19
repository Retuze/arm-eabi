# 集成 wasm3（WebAssembly 解释器）

wasm3 官方仓库：<https://github.com/wasm3/wasm3>（MIT License）。

本工程约定：上游代码放在 **`third_party/wasm3/upstream/`**，由 **`third_party/wasm3/CMakeLists.txt`** 只编译 `source/` 下的静态库 **`m3`**，不执行上游根目录里自带的可执行文件目标，便于与 **ARM 裸机 / 本仓库 CMake** 一起构建。

**共享构建**：根 **`CMakeLists.txt`** 始终 **`add_subdirectory(third_party/wasm3)`**，全工程只编译一份 **`m3`**。各固件在 **`project/<名>/CMakeLists.txt`** 里写 **`target_link_libraries(… PRIVATE m3)`** 即可。未拉取上游时，配置会在 **`third_party/wasm3/CMakeLists.txt`** 里失败（**`FATAL_ERROR`**），需先按下文放置 **`upstream/`**。

---

## 1. 获取上游源码

在仓库根目录（`arm-eabi/`）执行其一即可。

### 方式 A：Git 子模块（推荐，版本可固定）

首次添加子模块（会写入 `.gitmodules` 并登记提交）：

```bash
git submodule add https://github.com/wasm3/wasm3.git third_party/wasm3/upstream
git submodule update --init --recursive
```

他人克隆本仓库后初始化子模块：

```bash
git submodule update --init --recursive third_party/wasm3/upstream
```

将子模块固定到某一提交（在 `upstream` 目录内）：

```bash
cd third_party/wasm3/upstream
git checkout <tag 或 commit>
cd ../../..
git add third_party/wasm3/upstream
git commit -m "chore(wasm3): 固定上游版本"
```

升级上游到最新 `main`：

```bash
cd third_party/wasm3/upstream
git fetch origin
git checkout main
git pull
cd ../../..
git add third_party/wasm3/upstream
git commit -m "chore(wasm3): 升级上游"
```

### 方式 B：仅本地克隆（不纳入子模块）

适合快速试验；**不会**被 Git 自动带出，需自行备份或改为子模块。

```bash
git clone https://github.com/wasm3/wasm3.git third_party/wasm3/upstream
```

目录结构应出现：

```text
third_party/wasm3/upstream/source/m3_core.c
```

---

## 2. 配置与构建（普通预设即可）

```bash
cmake --preset release
cmake --build build/release --target wasm3_test
```

已放置 **`upstream/`** 并完成配置后，上述命令会生成 **`wasm3_test`**。

---

## 3. 示例工程 `wasm3_test`

仓库内 **`project/wasm3_test/`** 生成固件 **`wasm3_test`**（配置成功即已具备 **`m3`**）：

- 内嵌 **41 字节** 的最小 Wasm 模块（导出 **`add`**：两个 `i32` 相加，无 import）。
- 上电后调用 **`add(40, 2)`**，通过 RTT **`printf`** 打印结果（期望 **42**），并 **LED_RED** 闪烁。

构建示例：见上文第 2 节。

---

## 4. 在其它固件里链接 `m3`

在对应 **`project/<你的工程>/CMakeLists.txt`** 中：

```cmake
target_link_libraries(my_app PRIVATE platform ulibc m3)
```

本仓库默认假定已拉取 wasm3 上游；否则整树 **`cmake`** 不会通过。

头文件在上游目录中，例如：

```c
#include "wasm3.h"
```

包含路径已由 **`m3`** 的 **`INTERFACE`** 导出（包装 CMake 已设置 **`target_include_directories(m3 PUBLIC …)`**）。

**`m3`** 已通过 **`target_link_libraries(m3 PUBLIC ulibc)`** 依赖本仓库的 **ulibc**：`<stdlib.h>` / `<stdio.h>` / `<string.h>` 等由 **`ulibc/include`** 提供，**不需要** 再设置 GNU Arm 的 `--gcc-toolchain` 或 newlib 头路径。说明见 **[docs/ulibc.md](../ulibc.md)**。

---

## 5. 裸机 / WASI / 浮点

- 当前包装 **未** 定义 `d_m3HasWASI` / `d_m3HasUVWASI` 等宏，与常见裸机用法一致；若你需要 WASI，需自行在上游文档基础上增加宏与依赖（可能涉及 `uvwasi` 等）。
- wasm3 浮点路径使用的 **`isnan` / `signbit` / `NAN`** 等由 ulibc 的 **`<math.h>`**（Clang 内置）满足，一般 **无需** 链接 `libm`。

---

## 6. 许可证

使用 wasm3 时请在产品或发行说明中保留上游 **MIT** 许可证文本（见 `third_party/wasm3/upstream/LICENSE`）。
