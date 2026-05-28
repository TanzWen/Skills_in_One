# 在 Codex CLI 中使用

Codex CLI 原生支持 skills，格式与 Claude Code **完全一致**（`SKILL.md` + YAML frontmatter）。
官方文档：<https://developers.openai.com/codex/skills>

## 扫描位置

| 范围 | 路径 |
|---|---|
| 用户级（全局） | `~/.agents/skills/<name>/SKILL.md` |
| 项目级 | `<repo>/.agents/skills/<name>/SKILL.md` |

> 注意是 `~/.agents/`，不是 `~/.codex/`。

## 安装本仓库里的 skills

全局：

```bash
bash scripts/install-codex.sh
```

只对当前项目生效：

```bash
cd /path/to/your/project
bash /Users/tanzhiwen/Documents/code/Skills_in_One/scripts/install-codex.sh --project
```

自定义目标位置：

```bash
CODEX_SKILLS_DIR=~/some/other/dir bash scripts/install-codex.sh
```

脚本会把 `skills/*` 软链过去，修改源文件实时生效。Codex 已运行时需重启。

## 安装官方/精选 skill

在 Codex 会话里：

```
$skill-installer <skill名>
```

例如 `$skill-installer linear`。

## 禁用某个 skill

编辑 `~/.codex/config.toml`：

```toml
[[skills.config]]
path = "/Users/tanzhiwen/.agents/skills/<name>/SKILL.md"
enabled = false
```

重启 Codex。

## 与 Claude / ChatGPT 的关系

OpenAI 说明 ChatGPT / Codex / API 之间的 skills **不会自动同步**。本仓库的做法是把 `SKILL.md` 作为单一数据源，分别软链到：

- `~/.claude/skills/`（Claude Code，`install-claude.sh`）
- `~/.agents/skills/`（Codex CLI，`install-codex.sh`）

两边格式互通，无需转换。
