# SF32LB52 启动流程与简易 Bootloader 设计

本文面向 `SF32LB52JUD6 + QSPI NOR Flash` 这类典型二级启动场景，结合本仓库里的官方 SDK `boot_loader/project/butterflmicro` 实现，整理本板卡的启动链路、关键地址、长度约束、NOR Flash 初始化流程，以及如何自己实现一个简化版二级 Bootloader 来替代官方版本。

本文基于以下本地资料整理：

- `partfrom/SF32LB52x/docs/SDK/sifli-sdk/customer/boards/sf32lb52-nano_n16r16/ptab.json`
- `partfrom/SF32LB52x/docs/SDK/sifli-sdk/example/boot_loader/project/butterflmicro/board/main.c`
- `partfrom/SF32LB52x/docs/SDK/sifli-sdk/example/boot_loader/project/butterflmicro/board/boot_flash.c`
- `partfrom/SF32LB52x/docs/SDK/sifli-sdk/example/boot_loader/project/butterflmicro/ram_v2/link.lds`

## 1. 启动链路总览

SF32LB52 的启动可以理解为四步：

1. SoC 内部固化的一级 BootROM 上电运行。
2. BootROM 读取 Flash 配置表/分区表，找到二级 Bootloader 在外部 Flash 中的位置。
3. BootROM 将二级 Bootloader 从 Flash 装载到片上 RAM，并跳转到二级 Bootloader 执行。
4. 二级 Bootloader 初始化时钟、MPI/QSPI NOR、读取镜像表，最后跳转到用户主程序。

对于当前 `sf32lb52-nano_n16r16` 这份分区，实际链路可以写成：

`BootROM -> 0x12000000(Flash Table) -> 0x12010000(二级 Boot 镜像) -> 0x20020000(二级 Boot 运行地址) -> 0x12020000(主程序 XIP 地址)`

## 2. 本板卡的关键地址与长度

以下地址直接来自 `ptab.json`：

| 区域 | 介质 | 起始地址 | 最大长度 | 说明 |
| --- | --- | --- | --- | --- |
| Flash Table | QSPI NOR | `0x12000000` | `0x00008000` | Flash 配置表/镜像表 |
| Bootloader 镜像存储区 | QSPI NOR | `0x12010000` | `0x00010000` | 二级 Bootloader 在 Flash 中的存放位置 |
| 主程序 `main` | QSPI NOR | `0x12020000` | `0x00700000` | 用户主程序分区，支持 XIP |
| DFU | QSPI NOR | `0x12720000` | `0x00060000` | 官方 OTA/DFU 镜像 |
| 下载区 | QSPI NOR | `0x12780000` | `0x00120000` | OTA 临时下载区 |
| 文件系统 | QSPI NOR | `0x128A0000` | `0x00400000` | 文件系统区域 |
| Bootloader 运行区 | HCPU SRAM | `0x20020000` | `0x00010000` | 二级 Bootloader 的执行地址 |
| Bootloader 数据区 | HCPU SRAM | `0x20040000` | `0x00010000` | 二级 Bootloader 的 `.data/.bss/stack/heap` |

从官方 `ram_v2/link.lds` 可以进一步确认：

- `FLASH_BOOT_LOADER_START_ADDR = 0x20020000`
- `BOOTLOADER_RAM_DATA_START_ADDR = 0x20040000`

也就是说，官方二级 Bootloader 不是在 NOR 上直接执行，而是先放在 `0x12010000`，再由一级 BootROM 装载到 `0x20020000` 后运行。

## 3. 一级 BootROM 的装载原理

一级 BootROM 的源码不在 SDK 中，但从分区表、链接脚本和官方二级 Bootloader 的结构可以推断出其基本工作方式：

1. 上电后运行 SoC 内部固化的 BootROM。
2. BootROM 根据芯片启动脚位/Boot Option 判断启动介质，这块板子通常是从外部 NOR 启动。
3. BootROM 先访问 Flash 配置表区域，也就是 `0x12000000` 附近。
4. 通过分区/镜像表，定位二级 Bootloader 镜像所在分区，本板为 `0x12010000`。
5. 按二级 Bootloader 对应的执行地址，把镜像搬运到 `0x20020000`。
6. 读取该地址上的向量表：
   - `*(0x20020000 + 0)` 作为 MSP 初值
   - `*(0x20020000 + 4)` 作为 Reset Handler
7. 设置栈指针后跳转到二级 Bootloader。

这里有两个长度概念要区分：

- 分区最大长度：由 `ptab.json` 给出，本板二级 Boot 分区最大 `0x10000`，即 64 KB。
- 实际装载长度：通常由镜像头/构建产物大小决定，不能超过分区上限。

工程上可以把它理解为：

- `0x12010000` 是二级 Boot 的“镜像存放地址”
- `0x20020000` 是二级 Boot 的“运行地址”
- `0x00010000` 是这份二级 Boot 的“容量上限”

## 4. 官方二级 Bootloader 的职责

参考 `butterflmicro/board/main.c` 和 `boot_flash.c`，官方二级 Bootloader 主要负责以下事情：

1. 做非常早期的硬件预初始化。
2. 读取 eFuse，应用安全配置。
3. 给外部 Flash 上电。
4. 判断当前启动源是 SIP NOR、外部 NOR、NAND、SD 还是 eMMC。
5. 把系统时钟切到更高频率，保证后续 Flash 和总线访问性能。
6. 初始化对应的 MPI/Flash 控制器。
7. 从 Flash Table 中读取 `sec_configuration`。
8. 根据镜像表找到要运行的镜像。
9. 如果镜像是 XIP，就配置 alias/XIP；如果镜像要搬到 RAM，就先拷贝。
10. 如果启用了加密/签名，就在跳转前完成解密与校验。
11. 最后通过向量表跳转到用户程序。

对于我们当前这块板子的主程序分区 `main`，它的 `ftab.address` 是 `["base", "xip"]`，说明主程序默认是 XIP 方式运行，地址就是 `0x12020000`。

## 5. 二级 Bootloader 的实际执行流程

根据 `butterflmicro/board/main.c`，可以把二级 Boot 的主流程概括为：

```c
hw_preinit0();

board_flash_power_on();
HAL_MspInit();
board_boot_src = board_boot_from();

__HAL_SYSCFG_CLEAR_SECURITY();
dfu_flash_init();
boot_images_help();

while (1) {
}
```

其中关键步骤如下。

### 5.1 早期预初始化

`hw_preinit0()` 里主要做了三件事：

1. 调整部分上电相关阈值。
2. 执行 `boot_efuse_init_stage1()`，先读 eFuse bank0。
3. 检查是否存在 RAM Hook，如果有就优先跳去执行。

这一步的意义是让后续的安全配置、启动源判断和 Flash 初始化都在正确的芯片配置下进行。

### 5.2 给 Flash 上电并判断启动源

在 `main.c` 中：

- `board_flash_power_on()` 负责给外部 Flash 供电。
- `board_boot_from()` 负责判断实际的启动来源。

对于这块 Nano 板，正常场景下可以认为启动源是 `BOOT_FROM_NOR`，也就是外部 QSPI NOR。

### 5.3 切系统时钟到高速

在 `dfu_flash_init()` 中，官方 bootloader 会先做一轮时钟提升：

1. 使能 `XT48`
2. 系统时钟切到 `HXT48`
3. 外设时钟切到 `HXT48`
4. 使能 DLL
5. 把 HCPU HCLK 配到 `144 MHz`

代码里对应的是：

```c
HAL_HPAON_EnableXT48();
HAL_RCC_HCPU_ClockSelect(RCC_CLK_MOD_SYS, RCC_SYSCLK_HXT48);
HAL_RCC_HCPU_ClockSelect(RCC_CLK_MOD_HP_PERI, RCC_CLK_PERI_HXT48);
HAL_PMU_EnableDLL(1);
HAL_RCC_HCPU_ConfigHCLK(144);
```

这一步很重要，因为后续要稳定访问外部 NOR，并且通常希望比 BootROM 阶段更高的访问性能。

## 6. NOR Flash 初始化流程

对当前板子，重点看 `BOOT_FROM_NOR` 分支。

### 6.1 选择 Flash2 控制器

在 `dfu_flash_init()` 中：

```c
case BOOT_FROM_NOR:
case BOOT_FROM_NAND:
    HAL_RCC_HCPU_EnableDLL2(288000000);
    BSP_SetFlash2DIV(6);
    HAL_RCC_HCPU_ClockSelect(RCC_CLK_MOD_FLASH2, RCC_CLK_FLASH_DLL2);
    g_config_addr = init_mpi2(board_boot_src == BOOT_FROM_NOR ? 0 : 1);
    boot_handle = (FLASH_HandleTypeDef *)&spi_flash_handle[1].handle;
    break;
```

这表示：

- 外部 NOR/NAND 挂在 `MPI2/Flash2`
- Flash 时钟源切到 `DLL2`
- `DLL2 = 288 MHz`
- 分频设为 `6`
- 所以 bootloader 阶段实际 Flash 工作时钟是 `288 / 6 = 48 MHz`

注意这里是二级 Bootloader 自己初始化时使用的安全工作点，并不等同于板子资料里标称的 NOR 最高接口频率 `72 MHz`。后续如果应用阶段验证稳定，可以再提高。

### 6.2 配置管脚与总线模式

`init_mpi2()` 的逻辑是：

1. 调用 `board_pinmux_mpi2()` 配好外部 NOR 的引脚复用。
2. 若是 BootROM 场景，强制单线 SPI。
3. 若是二级 Bootloader 场景，使用 `HAL_FLASH_QMODE`，也就是 Quad 模式。
4. 调用 `HAL_FLASH_Init(...)` 完成 Flash 控制器初始化。

对应关键代码：

```c
board_pinmux_mpi2();
#ifdef CFG_BOOTROM
flash_cfg.line = HAL_FLASH_NOR_MODE;
#else
flash_cfg.line = HAL_FLASH_QMODE;
#endif
HAL_FLASH_Init(&(spi_flash_handle[1]), &flash_cfg, ... , BSP_GetFlash2DIV());
```

所以对 NOR 启动而言，官方流程本质上是：

1. Flash 上电
2. 配 Pinmux
3. 切 Flash 时钟
4. 以 Quad SPI 方式初始化 NOR
5. 建立内存映射/XIP 访问能力

### 6.3 读取 Flash Table / 安全配置表

Flash 初始化完成后，bootloader 会从 `g_config_addr` 读取 `sec_config_cache`：

```c
g_flash_read(g_config_addr, (const int8_t *)&sec_config_cache,
             sizeof(struct sec_configuration));
```

对这块板子而言，`g_config_addr` 最终就是 Flash Table 所在地址，也就是 `0x12000000`。

bootloader 会检查：

```c
sec_config_cache.magic == SEC_CONFIG_MAGIC
```

如果读取失败或 magic 不对，就认为 Flash 配置表无效，启动终止。

## 7. 用户程序的装载与跳转原理

官方 bootloader 跳转镜像的核心函数是：

```c
void run_img(uint32_t dest)
{
    __asm("LDR SP, [%0]" :: "r"(dest));
    __asm("LDR PC, [%0, #4]" :: "r"(dest));
}
```

也就是说，跳转本质非常直接：

1. `dest + 0` 处必须是栈顶地址 MSP
2. `dest + 4` 处必须是 Reset Handler 地址
3. bootloader 只要把镜像放到正确位置，然后加载这两个字即可完成跳转

对于本板的主程序 `main` 分区：

- Flash 存放地址：`0x12020000`
- XIP 运行地址：`0x12020000`

因此在非加密、XIP 场景下，bootloader 的动作通常是：

1. 初始化 NOR
2. 配置 Flash alias/XIP
3. 直接把 `0x12020000` 当成向量表基址
4. 从这里取 MSP 和 PC
5. 跳到用户程序

如果未来某个镜像不是 XIP，而是“存 Flash、跑 RAM”，那么 bootloader 需要先把镜像从 Flash 拷到目标 RAM，再对 RAM 地址执行同样的向量表跳转。

## 8. 当前工程可采用的简易 Bootloader 方案

如果我们不打算一开始就接入官方完整 DFU、安全启动、加密解密、双镜像升级机制，可以先自己写一个极简版二级 Bootloader。

它只需要负责四件事：

1. 初始化最基本的时钟。
2. 初始化外部 NOR Flash，并建立可读/XIP 访问。
3. 校验主程序镜像是否存在且向量表合法。
4. 跳转到 `0x12020000` 的用户程序。

### 8.1 建议保留的固定布局

建议继续沿用当前 `ptab.json` 的布局，不要随意改地址：

- 二级 Bootloader Flash 存储地址：`0x12010000`
- 二级 Bootloader RAM 执行地址：`0x20020000`
- 二级 Bootloader RAM 数据区：`0x20040000`
- 用户主程序地址：`0x12020000`

这样做的好处是：

- 可以继续兼容现有分区表和烧录流程
- 后续若要切回官方 bootloader，迁移成本低
- 应用链接地址不需要重改

### 8.2 极简 Bootloader 的推荐目录结构

可以把自定义 bootloader 代码放在 `project/blink/boot` 下，建议拆成下面几类：

- `main.c`：启动主流程
- `boot_flash.c`：NOR Flash 初始化和读取接口
- `boot_jump.c`：镜像检查与跳转
- `boot_cfg.h`：固定地址、长度、时钟参数
- `link.ld`：bootloader 专用链接脚本

### 8.3 极简 Bootloader 的流程建议

推荐流程如下：

```text
Reset
 -> 初始化最小系统时钟
 -> 给外部 NOR 上电
 -> 配置 MPI2 pinmux
 -> 初始化 QSPI NOR
 -> 检查 0x12020000 是否存在合法向量表
 -> 如有需要，做 CRC/版本检查
 -> 关闭或整理 bootloader 使用过的状态
 -> 设置 MSP
 -> 跳转到应用 Reset_Handler
```

对应的伪代码可以写成：

```c
#define BL_FLASH_BASE      0x12010000U
#define BL_FLASH_LIMIT     0x12020000U
#define APP_XIP_BASE       0x12020000U
#define APP_MAX_SIZE       0x00700000U
#define BL_EXEC_BASE       0x20020000U
#define BL_EXEC_SIZE       0x00010000U
#define BL_DATA_BASE       0x20040000U
#define BL_DATA_SIZE       0x00010000U

static int app_vector_is_valid(uint32_t app_base)
{
    uint32_t sp = *(volatile uint32_t *)(app_base + 0);
    uint32_t pc = *(volatile uint32_t *)(app_base + 4);

    if ((sp & 0xFFF00000U) != 0x20000000U)
        return 0;
    if (pc == 0xFFFFFFFFU || pc == 0x00000000U)
        return 0;
    return 1;
}

int main(void)
{
    clock_init_minimal();
    board_flash_power_on();
    board_pinmux_mpi2();
    qspi_nor_init();

    if (!app_vector_is_valid(APP_XIP_BASE))
        while (1) {}

    jump_to_image(APP_XIP_BASE);
}
```

### 8.4 最小可行校验建议

最开始建议至少做下面三项校验：

1. 栈顶地址 `SP` 是否落在 HCPU SRAM 区间。
2. 复位入口 `PC` 是否非空，且 Thumb 位有效。
3. 应用镜像头或前若干字节不是全 `0xFF`。

如果再稳一点，可以增加：

4. 固定头结构校验
5. 镜像长度字段检查
6. CRC32 校验

这样就算先不做签名和加密，也足够支撑一个稳定的开发阶段 bootloader。

## 9. 自研 Bootloader 与官方 Bootloader 的取舍

官方 `butterflmicro` Bootloader 的优点是功能完整，包含：

- 启动源适配
- Flash/NAND/SD/eMMC 支持
- `sec_configuration` 镜像表管理
- XIP alias
- 加密解密
- 签名校验
- OTA/DFU 相关逻辑

但如果当前项目只是 `blink` 级别的基础工程验证，这套逻辑会偏重。

一个自研极简 Bootloader 可以先只保留：

- 时钟初始化
- NOR 初始化
- 主程序合法性检查
- 跳转执行

建议策略是：

1. 第一阶段先实现“固定地址跳转版”。
2. 第二阶段加上简单镜像头和 CRC。
3. 第三阶段如果需要 OTA，再考虑兼容官方 `sec_configuration` 或直接复用官方 bootloader。

## 10. 对当前 blink 工程的落地建议

如果后面要在 `blink` 里真正实现自己的 bootloader，建议按下面的固定约束推进：

1. bootloader 产物链接到 `0x20020000`
2. bootloader 总大小控制在 `64 KB` 以内
3. bootloader 的 `.data/.bss/stack/heap` 只使用 `0x20040000 ~ 0x2004FFFF`
4. 应用程序继续链接在 `0x12020000`
5. 第一版先只支持 `BOOT_FROM_NOR`
6. 第一版先不做加密、不做 DFU、不做双镜像切换

这样最容易把链路打通。

## 11. 一句话总结

对这块板子而言，最重要的启动事实是：

- 一级 BootROM 在芯片内部，不需要我们写。
- 二级 Bootloader 存在 NOR 的 `0x12010000`，运行在 SRAM 的 `0x20020000`，大小上限 `64 KB`。
- 二级 Bootloader 完成时钟和 NOR 初始化后，最终跳到主程序 `0x12020000`。
- 主程序当前是典型的 XIP 模式，不需要先整体搬运到 RAM。

如果后续我们自己写 bootloader，第一版完全可以只做“初始化 NOR + 校验向量表 + 跳转应用”这一条最短路径。
