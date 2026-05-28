# Skills in One

个人 Skills 合集 —— 一份源文件，同时给 **Claude Code**、**Codex CLI**、**Gemini Gem** 使用。

## 目录结构

```
Skills_in_One/
├── README.md                ← 本文件
├── skills/                  ← 你的 skills（每个一个目录）
│   └── <skill-name>/
│       ├── SKILL.md         ← 单一数据源（Claude 原生格式）
│       ├── PROMPT.md        ← 可选：纯文本版，给 Codex/Gemini 直接粘贴
│       └── resources/       ← 可选：参考文档、脚本、示例
├── templates/
│   └── my-skill/            ← 复制此目录新建 skill
├── scripts/
│   ├── install-claude.sh    ← 把 skills 软链到 ~/.claude/skills
│   └── export.sh            ← 把某个 SKILL.md 导出成可粘贴的 prompt
└── docs/
    ├── claude.md            ← 在 Claude Code 中使用
    ├── codex.md             ← 在 Codex CLI 中使用
    └── gemini.md            ← 在 Gemini Gem 中使用
```

## 快速开始

### 1. 新建一个 skill

```bash
cp -R templates/my-skill skills/my-new-skill
# 编辑 skills/my-new-skill/SKILL.md
```

### 2. 在不同平台启用

| 平台 | 方法 | 详见 |
|---|---|---|
| Claude Code | `bash scripts/install-claude.sh` 软链到 `~/.claude/skills/` | [docs/claude.md](docs/claude.md) |
| Codex CLI | `bash scripts/export.sh skills/<name>` 复制输出到 `AGENTS.md` 或 `--system` | [docs/codex.md](docs/codex.md) |
| Gemini Gem | `bash scripts/export.sh skills/<name>` 复制输出粘贴到 Gem 的 Instructions | [docs/gemini.md](docs/gemini.md) |

## 设计原则

- **单一数据源**：每个 skill 只在 `SKILL.md` 里维护一次。
- **平台无关**：`SKILL.md` 内容是纯自然语言指令 + Markdown，不依赖任何平台 API。
- **可移植资源**：脚本/参考文档放 `resources/`，在指令里用相对路径引用。
- **frontmatter 兼容**：Claude 用 YAML 头识别 skill；其他平台导出时会被剥离。

## SKILL.md 格式

```markdown
---
name: skill-name-in-kebab-case
description: 一句话说明何时触发（最重要，用于路由）
---

# Skill Title

## 何时使用
...

## 操作步骤
...

## 输出格式
...
```

详见 [templates/my-skill/SKILL.md](templates/my-skill/SKILL.md)。
