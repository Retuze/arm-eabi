# LCD test build

该工程用于：

- 初始化 GPIO 模拟 QSPI LCD 驱动。
- 渲染整屏矩形（当前默认整屏蓝色）。
- 将软件模拟 QSPI 关键时序函数放入 RAM 执行（`.ramfunc`）。
- 用 `LCD_CLK` 做高速翻转并统计翻转速率（结果写到全局变量供调试器读取）。

## Configure

```powershell
cd project\lcd_test
cmake --preset clang-ninja
```

## Build

```powershell
cd project\lcd_test
cmake --build --preset lcd_test
```

## Speed metric

程序运行后可在调试器中查看：

- `g_io_toggle_count`
- `g_io_toggle_duration_ms`
- `g_io_toggle_hz`

`g_io_toggle_hz` 表示 `LCD_CLK` 的估算翻转频率（Hz，包含高低电平两次翻转）。
