# 在 Codex CLI 中使用

Codex 没有原生 skill 机制，但支持通过 `AGENTS.md`（项目级）或自定义 system prompt 注入指令。

## 方式 A：项目级 AGENTS.md

把导出内容追加到当前项目的 `AGENTS.md`：

```bash
bash scripts/export.sh skills/<skill-name> >> AGENTS.md
```

Codex 启动时会自动读取 `AGENTS.md`。

## 方式 B：全局规则

把导出内容放进 `~/.codex/AGENTS.md`（或你的 Codex 全局配置位置），所有会话都会加载。

```bash
bash scripts/export.sh skills/<skill-name> >> ~/.codex/AGENTS.md
```

## 方式 C：单次粘贴

```bash
bash scripts/export.sh skills/<skill-name> | pbcopy
```

然后在 Codex 会话开头粘贴。

## 多 skill 合并

```bash
for d in skills/*/; do
  echo "## $(basename "$d")"
  bash scripts/export.sh "$d"
  echo
done > codex-bundle.md
```

## 注意

- 导出脚本会自动剥离 YAML frontmatter。
- 如果 skill 引用了 `resources/` 下的文件，加 `--with-resources` 把内容内联进来：
  ```bash
  bash scripts/export.sh skills/<name> --with-resources
  ```
