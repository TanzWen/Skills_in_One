# 在 Claude Code 中使用

Claude Code 会自动加载 `~/.claude/skills/` 下的每个子目录作为一个 skill。

## 安装

```bash
bash scripts/install-claude.sh
```

脚本会把 `skills/*` 软链到 `~/.claude/skills/`。修改源文件后无需重新安装，软链实时生效。

自定义目标位置：

```bash
CLAUDE_SKILLS_DIR=~/my-other-skills bash scripts/install-claude.sh
```

## 验证

在 Claude Code 里输入 `/skills`，应能看到刚装好的 skill。或直接触发匹配 `description` 的请求，Claude 会自动调用。

## 注意

- `SKILL.md` 必须有 YAML frontmatter，且 `name` 与目录名一致。
- `description` 字段是路由的关键，写得越具体越容易被命中。
- `resources/` 下的文件可以在 `SKILL.md` 里用相对路径引用，Claude 会按需读取。
