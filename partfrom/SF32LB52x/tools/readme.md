sftool 工具使用指南

对于本仓库当前使用的 `elf` 镜像，烧录命令不需要额外指定 `@地址`。

通用形式：

```powershell
.\sftool -c SF32LB52 -p <PORT> write_flash firmware.elf
```

如果镜像本身已经按正确链接地址生成，`sftool` 会按 `elf` 内部信息完成烧录。
