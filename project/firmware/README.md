# Firmware

`project/firmware` 是一套基于 SiFli SDK 已构建完成的固件产物目录，用来保存一个最小 LED 闪烁固件所需的几个核心镜像：

- 分区表 / Flash Table：`ftab`
- 二级 Bootloader：`bootloader`
- 主应用镜像：`main.elf`

这套目录更接近“SDK 构建输出结果”，而不是当前仓库里像 `blink`、`test` 那样的手写 CMake 工程。

## 工程定位

这个目录描述的是一套完整可启动的固件布局，而不是单独的一个 `elf` 文件。

启动链路可以理解为：

1. Flash 起始位置先放分区表 `ftab`
2. Boot ROM / 启动链根据分区表和固定布局加载二级 bootloader
3. 二级 bootloader 完成 Flash、时钟、镜像检查等初始化
4. bootloader 跳转到主应用 `main.elf`
5. 主应用运行 LED 闪烁逻辑

所以这里的“固件”实际由三部分共同组成，不是只有 `main.elf`。

## 目录结构

- [main.elf](/d:/eabi-arm/arm-eabi/project/firmware/main.elf)
  主应用镜像，运行在应用分区。
- [bootloader](/d:/eabi-arm/arm-eabi/project/firmware/bootloader)
  SDK 构建出来的二级 bootloader 产物目录。
- [ftab](/d:/eabi-arm/arm-eabi/project/firmware/ftab)
  SDK 构建出来的 flash table / partition table 产物目录。

### bootloader 目录

`bootloader` 目录中包含：

- [bootloader.elf](/d:/eabi-arm/arm-eabi/project/firmware/bootloader/bootloader.elf)
- [bootloader.bin](/d:/eabi-arm/arm-eabi/project/firmware/bootloader/bootloader.bin)
- [bootloader.hex](/d:/eabi-arm/arm-eabi/project/firmware/bootloader/bootloader.hex)
- [bootloader.map](/d:/eabi-arm/arm-eabi/project/firmware/bootloader/bootloader.map)
- [ptab.h](/d:/eabi-arm/arm-eabi/project/firmware/bootloader/ptab.h)
- [link_copy.lds](/d:/eabi-arm/arm-eabi/project/firmware/bootloader/link_copy.lds)
- `.config`、`rtconfig.h`、`compile_commands.json`

这部分对应 SDK 的二级 bootloader 工程构建结果。

### ftab 目录

`ftab` 目录中包含：

- [ftab.elf](/d:/eabi-arm/arm-eabi/project/firmware/ftab/ftab.elf)
- [ftab.bin](/d:/eabi-arm/arm-eabi/project/firmware/ftab/ftab.bin)
- [ftab.hex](/d:/eabi-arm/arm-eabi/project/firmware/ftab/ftab.hex)
- [ftab.map](/d:/eabi-arm/arm-eabi/project/firmware/ftab/ftab.map)
- [ptab.h](/d:/eabi-arm/arm-eabi/project/firmware/ftab/ptab.h)
- [link_copy.lds](/d:/eabi-arm/arm-eabi/project/firmware/ftab/link_copy.lds)
- `.config`、`rtconfig.h`、`compile_commands.json`

这部分对应 SDK 里的 Flash Table / 分区表工程构建结果。

## 分区表说明

当前分区定义可以直接从 [ftab/ptab.h](/d:/eabi-arm/arm-eabi/project/firmware/ftab/ptab.h) 和 [bootloader/ptab.h](/d:/eabi-arm/arm-eabi/project/firmware/bootloader/ptab.h) 看出来。

关键地址如下：

- Flash Table 起始地址：`0x12000000`
- Flash Table 大小：`0x00008000`
- 主应用 `HCPU_FLASH_CODE` 起始地址：`0x12020000`
- 主应用 `HCPU_FLASH_CODE` 大小：`0x00700000`
- DFU 区起始地址：`0x12720000`
- DFU 下载区起始地址：`0x12780000`
- 文件系统区起始地址：`0x128A0000`

RAM 相关布局如下：

- HCPU RAM：`0x20000000`，大小 `0x0007FC00`
- Bootloader 执行地址：`0x20020000`
- Bootloader 数据 RAM：`0x20040000`
- PSRAM 起始地址：`0x60000000`

这里要特别注意：

- `bootloader` 不是直接 XIP 在 Flash 上运行，而是链接到 RAM 执行区 `0x20020000`
- 主应用 `main.elf` 是放在 Flash 应用区 `0x12020000`
- `ftab` 则放在 Flash 最前面的表区 `0x12000000`

## 三个镜像之间的关系

可以把这三部分理解成下面的关系：

- `ftab`
  负责描述整片 Flash / RAM 的布局，是启动链的地址依据。
- `bootloader`
  负责初始化硬件、识别启动源、检查镜像并跳转应用。
- `main.elf`
  真正的业务固件，这里是一个基于 SDK 构建的 LED 闪烁应用。

如果缺了 `ftab`，bootloader 和主应用的地址关系就不完整。  
如果缺了 `bootloader`，主应用通常不能按 SDK 预期方式启动。  
如果缺了 `main.elf`，bootloader 启动后也没有可跳转的应用。

## 典型烧录顺序

如果要按完整固件链路烧录，推荐顺序是：

1. 先烧录 `ftab`
2. 再烧录 `bootloader`
3. 最后烧录主应用 `main.elf`

对应地址为：

- `ftab.elf` -> `0x12000000`
- `bootloader.elf` -> 由 bootloader 工程布局决定，实际运行地址在 RAM `0x20020000`
- `main.elf` -> `0x12020000`

这里需要注意一点：

`bootloader/ptab.h` 中的 `FLASH_BOOT_LOADER_START_ADDR` 是 `0x20020000`，这是 bootloader 的执行/链接地址，不等于最终 Flash 镜像的“文件放置方式”描述。  
如果后续要精确整理 bootloader 的烧录命令，最好结合 SDK 原始工程的下载脚本或 postbuild 规则一起确认。

## 烧录方式

当前仓库里可见的通用下载工具是：

- [sftool.exe](/d:/eabi-arm/arm-eabi/partfrom/SF32LB52x/tools/sftool.exe)

工具用法参考：

- [readme.md](/d:/eabi-arm/arm-eabi/partfrom/SF32LB52x/tools/readme.md)

通用命令形式为：

```powershell
partfrom\SF32LB52x\tools\sftool.exe -c SF32LB52 -p <PORT> write_flash firmware.elf
```

按这个目录中的产物，主应用的典型烧录命令可以写成：

```powershell
partfrom\SF32LB52x\tools\sftool.exe -c SF32LB52 -p <PORT> write_flash project\firmware\main.elf
```

`ftab` 的典型烧录命令：

```powershell
partfrom\SF32LB52x\tools\sftool.exe -c SF32LB52 -p <PORT> write_flash project\firmware\ftab\ftab.elf
```

bootloader 的命令建议以后再结合 SDK 原始下载脚本核实一次，因为它既涉及 Flash 中镜像组织，又涉及 RAM 执行地址。

对于本仓库当前使用的 `elf` 镜像，烧录命令不需要额外追加 `@地址`。镜像本身已经带有链接布局信息。

## 编译来源说明

从 [compile_commands.json](/d:/eabi-arm/arm-eabi/project/firmware/bootloader/compile_commands.json) 可以看出，这套 bootloader / ftab 产物来自 SiFli SDK 的原始工程，而不是本仓库自己写的 CMake。

能看到的关键信息包括：

- 使用的是 `arm-none-eabi-gcc`
- 来源工程指向 SDK `example/boot_loader/project/butterflmicro`
- 板级配置使用 `sf32lb52-nano_n16r16`

这说明 `project/firmware` 更像是“SDK 编译结果归档目录”。

## 当前目录适合做什么

这套目录很适合做下面这些事情：

- 对照 SDK 原生产物，确认地址布局是否正确
- 和 `blink` / `test` 做启动链路对比
- 提取 `ptab.h` 里的分区信息，作为自定义工程的地址参考
- 对照 `bootloader.map` / `ftab.map` 理解 SDK 的启动流程

## 当前目录不包含什么

这个目录当前不包含一套可直接重新完整构建主应用 `main.elf` 的工程脚本。  
它主要保存的是已经生成好的 SDK 构建产物，而不是完整的顶层源码工程入口。

## 常用文件

- [main.elf](/d:/eabi-arm/arm-eabi/project/firmware/main.elf)
- [bootloader.elf](/d:/eabi-arm/arm-eabi/project/firmware/bootloader/bootloader.elf)
- [bootloader.map](/d:/eabi-arm/arm-eabi/project/firmware/bootloader/bootloader.map)
- [ftab.elf](/d:/eabi-arm/arm-eabi/project/firmware/ftab/ftab.elf)
- [ftab.map](/d:/eabi-arm/arm-eabi/project/firmware/ftab/ftab.map)
- [ftab/ptab.h](/d:/eabi-arm/arm-eabi/project/firmware/ftab/ptab.h)
- [bootloader/ptab.h](/d:/eabi-arm/arm-eabi/project/firmware/bootloader/ptab.h)
