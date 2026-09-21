# 贡献指南 / Contributing

感谢您关注 **clash2n**！本文档帮助您搭建开发环境并开始贡献。
Thank you for your interest in contributing to **clash2n**! This guide helps you set up your development environment and start contributing.

## 国际化 / Internationalization (i18n)

欢迎翻译和改进现有语言文件，详见 [CONTRIBUTING_i18n.md](docs/CONTRIBUTING_i18n.md)。
We welcome translations and improvements to existing locales. For details, see [CONTRIBUTING_i18n.md](docs/CONTRIBUTING_i18n.md).

## 贡献期望 / Contribution Expectations

欢迎 AI 辅助贡献——AI 本身不是问题。我们要求的是**责任感**：每个 PR 必须表明已理解所述问题，且改动是有针对性地解决它。无写权限的贡献者的 PR 会经过自动化审查（[`pr-ai-slop-review`](.github/workflows/pr-ai-slop-review.md)），可能标记高风险提交为 `ai-slop:med` 或 `ai-slop:high`。审查策略维护在该文件中，编译为 `pr-ai-slop-review.lock.yml`（`gh aw compile`）；请勿手动编辑锁文件。如需调整审查策略，最简单的方式是让 AI 编码 agent 执行修改——工作流详见 [AGENTS.md](AGENTS.md)。

We welcome AI-assisted contributions — AI assistance itself is not a problem. What we require is **ownership**: every pull request must show that the stated problem is understood and that the change deliberately solves it. Incoming pull requests from contributors without write access are screened by an automated review ([`pr-ai-slop-review`](.github/workflows/pr-ai-slop-review.md)) that evaluates this ownership evidence and may label high-risk submissions `ai-slop:med` or `ai-slop:high`. The policy is maintained in that file and compiled into `pr-ai-slop-review.lock.yml` (`gh aw compile`); never edit the lock file by hand. If you want to adjust the review policy, the easiest path is directing an AI coding agent to make the change — the workflow is documented in [AGENTS.md](AGENTS.md).

为确保贡献得到公正评估 / To make sure your contribution is assessed fairly:

- **关联已有 issue。** 非平凡改动应修复或实现已报告的问题。PR 之后才创建的 issue 信号远弱于真实问题报告。
- **diff 与 issue 对应。** 每个改动区域都应能从关联 issue 解释。无关重构、格式化、依赖升级应放入独立 PR。
- **用自己的话描述问题。** 简短说明什么坏了或需要什么、为什么这个方案能修复，比冗长的生成报告更有价值。
- **针对报告行为验证。** 展示如何复现并确认修复。通用清单和原始工具输出不算验证。
- **Do not pad with tests or defensive code.** 默认不期望新增测试。仅当关联 issue 需要时才添加，保持最小化，并在 PR 中说明必要性；推测性错误处理和假设失败模式的防御代码只会增大 diff 而无附加价值。
- **披露 AI 自动化。** 如果 AI agent 产出或共同产出改动，在 PR 正文末尾加上模型和 effort 级别（例如 `Assisted by: GPT-5.6 High`；effort 可选）。PR 模板有意省略此行，agent 自行添加。披露仅为透明度——不影响评估结果。

- **Link a pre-existing issue.** Non-trivial changes should fix or implement something already reported in an issue. An issue created after the pull request is a much weaker signal than a genuine problem report.
- **Keep the diff mapped to the issue.** Every changed area should be explainable from the linked issue. Unrelated refactors, formatting churn, or dependency bumps belong in separate pull requests with their own motivation.
- **Describe the problem in your own words.** A short statement of what breaks or what is needed, and why this approach fixes it, is worth more than a long generated report.
- **Validate against the reported behavior.** Show how the reported problem was reproduced and confirmed fixed. Generic checklists and raw tool output are not verification.
- **Do not pad with tests or defensive code.** New tests are not expected by default. Add them only when the linked issue calls for them, keep them minimal, and explain in the pull request why each is necessary; speculative error handling and coverage of hypothetical failure modes inflate the diff without adding value.
- **Disclose AI automation.** If an AI agent produced or co-produced the change, end the pull request body with the model and effort level (for example, `Assisted by: GPT-5.6 High`; effort is optional when your tool does not report it). The PR template intentionally omits this footer; agents add it themselves. Disclosure is transparency only — it does not affect how the change is assessed.

如果 PR 收到 `ai-slop` 标签，清除它的最快方式是实质性行动：关联（或请我们创建）底层 issue、缩小范围、或推送回应审查反馈的改动。仅编辑 PR 描述不会改变评估结果。

If your pull request receives an `ai-slop` label, the fastest way to clear it is substantive: link (or ask us to create) the underlying issue, narrow the scope, or push implementation changes that respond to review feedback. Editing the pull request description alone does not change the assessment.

## 开发环境搭建 / Development Setup

贡献前需搭建开发环境，请仔细按以下步骤操作。
Before contributing, set up your development environment by following the steps below.

### 前置条件 / Prerequisites

1. **安装 Rust 和 Node.js / Install Rust and Node.js**
   项目同时需要 Rust 和 Node.js，按官方指南安装：[tauri.app/start/prerequisites](https://tauri.app/start/prerequisites/)。
   The project requires both Rust and Node.js. Follow the official installation instructions [here](https://tauri.app/start/prerequisites/).

### Windows 用户 / Windows Users

> [!NOTE]
> **Windows ARM 用户还需安装 [LLVM](https://github.com/llvm/llvm-project/releases)（含 clang）并设置环境变量。** `ring` crate 在 Windows ARM 上构建时依赖 `clang`。
> **Windows ARM users must also install [LLVM](https://github.com/llvm/llvm-project/releases) (including clang) and set the corresponding environment variables.** The `ring` crate depends on `clang` when building on Windows ARM.

Windows 额外步骤 / Additional steps for Windows:

- 确保 Rust 和 Node.js 已加入系统 `PATH`。
- 安装 GNU `patch` 工具。
- 使用 MSVC 工具链：
- Ensure Rust and Node.js are added to your system `PATH`.
- Install the GNU `patch` tool.
- Use the MSVC toolchain:

```bash
rustup target add x86_64-pc-windows-msvc
rustup set default-host x86_64-pc-windows-msvc
```

### 安装包管理器 / Install Package Manager

启用 `corepack` / Enable `corepack`:

```bash
corepack enable
```

### 安装项目依赖 / Install Project Dependencies

Node.js 依赖 / Node.js dependencies:

```bash
pnpm install
```

Ubuntu 系统包 / Ubuntu-only system packages:

```bash
sudo apt-get install -y libxslt1.1 libwebkit2gtk-4.1-dev libayatana-appindicator3-dev librsvg2-dev patchelf
```

### 下载 Mihomo 内核 / Download Mihomo Core

```bash
pnpm run prebuild
pnpm run prebuild --force  # 重新下载并覆盖 Mihomo 内核和服务二进制 / Re-download and overwrite
```

### 启动开发服务器 / Run the Development Server

```bash
pnpm dev           # 标准 / Standard
pnpm dev:diff      # 已有实例时使用 / If an app instance already exists
pnpm dev:tauri     # Tauri 开发模式 / Tauri development mode
```

### 构建项目 / Build the Project

```bash
pnpm build         # 标准构建 / Standard build
pnpm build:fast    # 快速构建（测试用）/ Fast build for testing
```

### 清理构建 / Clean Build

```bash
pnpm clean
```

### 便携版（仅 Windows）/ Portable Version (Windows Only)

```bash
pnpm portable
```

## 提交你的改动 / Contributing Your Changes

### 提交前 / Before Committing

**代码质量检查 / Code quality checks:**

```bash
cargo clippy-all    # Rust 后端 / Rust backend
pnpm lint           # 前端 / Frontend
```

**代码格式化 / Code formatting:**

```bash
cargo fmt           # Rust 后端 / Rust backend
pnpm format         # 前端 / Frontend
```

### 签名提交 / Signing Your Commit

需要签名提交以验证作者身份，确保贡献可被合并。参考 [GitHub 签名提交文档](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)。
Signed commits are required to verify authorship and ensure your contributions can be merged. See [signing commits](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits).

### 提交流程 / Submitting Your Changes

1. Fork 仓库 / Fork the repository.
2. 为功能或修复创建新分支 / Create a new branch for your feature or bug fix.
3. 用清晰的 message 提交改动并签名 / Commit your changes with clear messages and make sure it's signed.
4. 推送分支并提交 PR / Push your branch and submit a pull request.

感谢您的贡献，期待您的参与！
We appreciate your contributions and look forward to your participation!
