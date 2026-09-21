<h1 align="center">
  <img src="./client/icons/icon.png" alt="clash2n" width="128" />
  <br>
  clash2n
</h1>

<h3 align="center">
基于 <a href="https://github.com/tauri-apps/tauri">Tauri</a> 的 Clash Meta（mihomo）桌面客户端，fork 自 <a href="https://github.com/clash-verge-rev/clash-verge-rev">clash-verge-rev</a>。
<br>
A Clash Meta GUI based on <a href="https://github.com/tauri-apps/tauri">Tauri</a>, forked from <a href="https://github.com/clash-verge-rev/clash-verge-rev">clash-verge-rev</a>.
</h3>

<p align="center">
  语言 / Languages:
  <a href="./README.md">简体中文</a> ·
  <a href="./docs/README_en.md">English</a> ·
  <a href="./docs/README_ja.md">日本語</a> ·
  <a href="./docs/README_ko.md">한국어</a> ·
  <a href="./docs/README_es.md">Español</a> ·
  <a href="./docs/README_ru.md">Русский</a> ·
  <a href="./docs/README_fa.md">فارسی</a>
</p>

## 预览 / Preview

| 深色 / Dark | 浅色 / Light |
| --- | --- |
| ![深色预览](./docs/preview_dark.png) | ![浅色预览](./docs/preview_light.png) |

## 安装 / Install

前往发布页面下载对应平台的安装包。
Go to the [Release page](https://github.com/clash-verge-rev/clash-verge-rev/releases) to download the installation package for your platform.

支持 Windows（x64/x86）、Linux（x64/arm64）和 macOS 11+（Intel/Apple Silicon）。
Supports Windows (x64/x86), Linux (x64/arm64) and macOS 11+ (Intel/Apple Silicon).

#### 版本说明 / Versions

| 版本 / Version | 特征 / Description | 链接 / Link |
| :--- | :--- | :--- |
| Stable | 正式版，高可靠性，适合日常使用 / Stable release, high reliability | [Release](https://github.com/clash-verge-rev/clash-verge-rev/releases) |
| AutoBuild | 滚动更新版，适合测试反馈 / Rolling build for testing feedback | [AutoBuild](https://github.com/clash-verge-rev/clash-verge-rev/releases/tag/autobuild) |

安装说明与常见问题请查阅文档站。
For installation guides and FAQ, visit the [documentation site](https://clash-verge-rev.github.io/).

---

## 功能特性 / Features

- 基于 Rust 和 Tauri 2 框架，性能强劲 / Built on Rust and Tauri 2 for high performance
- 内置 [Clash.Meta（mihomo）](https://github.com/MetaCubeX/mihomo) 内核，支持切换 Alpha 版本 / Bundled [mihomo](https://github.com/MetaCubeX/mihomo) core with Alpha switch support
- 简洁美观的界面，支持自定义主题色、代理组/托盘图标及 CSS Injection / Clean UI with custom themes, tray icons and CSS Injection
- 配置文件管理与增强（Merge 和 Script），配置文件语法提示 / Profile management with Merge/Script enhancement and syntax hints
- 系统代理与守卫、TUN（虚拟网卡）模式 / System proxy guard and TUN (virtual NIC) mode
- 可视化节点与规则编辑 / Visual node and rule editing
- WebDAV 配置备份与同步 / WebDAV config backup and sync

### 常见问题 / FAQ

参见文档 FAQ。
See the [documentation FAQ](https://clash-verge-rev.github.io/faq/windows.html).

---

## 开发 / Development

环境准备请先阅读 [CONTRIBUTING.md](./CONTRIBUTING.md)，并安装 Tauri 所需的全部前置依赖。
Read [CONTRIBUTING.md](./CONTRIBUTING.md) first and install all Tauri prerequisites.

### 目录结构 / Directory Structure

```
clash2n/
├── front/      # 前端 / Frontend (React + TypeScript + Vite)
├── client/     # Tauri/Rust 客户端 / Client (workspace + crates)
├── scripts/    # 构建/开发/发布编排脚本 / Build & release scripts
└── package.json # 顶层编排入口 / Top-level orchestration
```

### 本地开发 / Local Development

```shell
pnpm i
pnpm run prebuild
pnpm dev
```

`pnpm dev` 保留开发通道已安装的服务状态：已有服务直接复用，未安装则以 Sidecar 模式启动。如需显式安装或更新开发服务，使用 `pnpm dev:service`；强制 Sidecar 模式用 `pnpm dev:sidecar`。
`pnpm dev` preserves the Development Channel's installed service state. Use `pnpm dev:service` to install/update the dev service, or `pnpm dev:sidecar` to force Sidecar mode.

### 本地验证 / Local Check

提交前可运行本地全量检查，无需等待 CI 反馈：
Run a full local check before pushing to avoid waiting for CI:

```shell
./check.sh
```

该脚本依次执行前端 typecheck + lint + build 和 Rust clippy + build。
Runs frontend typecheck + lint + build, then Rust clippy + build.

---

## 贡献 / Contributing

欢迎提交 Issue 和 PR。Issue and PR welcome!

## 致谢 / Acknowledgement

clash2n 基于 clash-verge-rev 二次开发，后者基于或受以下项目启发：
clash2n is forked from clash-verge-rev, which was based on or inspired by:

- [zzzgydi/clash-verge](https://github.com/zzzgydi/clash-verge)：基于 Tauri 的 Clash GUI
- [tauri-apps/tauri](https://github.com/tauri-apps/tauri)：更小、更快、更安全的桌面应用框架
- [MetaCubeX/mihomo](https://github.com/MetaCubeX/mihomo)：Go 实现的规则隧道
- [vitejs/vite](https://github.com/vitejs/vite)：下一代前端工具链

## 隐私 / Privacy

clash2n 不收集任何用户数据，配置与日志仅保存在本地。详见[隐私政策](./PRIVACY.md)。
clash2n does not collect any user data; configuration and logs stay on your device. See the [Privacy Policy](./PRIVACY.md).

## 许可证 / License

GPL-3.0 许可证，详见 [LICENSE](./LICENSE)。
GPL-3.0 License, see [LICENSE](./LICENSE) for details.
