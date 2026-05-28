---
name: my-skill
description: 用一句话描述何时该触发此 skill。例如"当用户请求把图片转成 ASCII art 时使用"。description 是路由依据，要具体、含触发关键词。
---

# My Skill

> 把上面 frontmatter 的 name 改成 kebab-case 的目录名，与所在目录同名。

## 何时使用

- 列出触发场景，越具体越好
- 也可以列出**不应**触发的反例

## 输入

说明这个 skill 期望的输入（用户提供的文件、参数、上下文等）。

## 操作步骤

1. 第一步：……
2. 第二步：……
3. 第三步：……

按需引用同目录下的辅助文件（按职责分目录，与 Anthropic 官方 skill 约定一致）：

- `references/` — **参考资料**（查表、案例、术语表）。模型按需 Read，不会全量加载。
- `scripts/` — **可执行脚本**（Python / Bash / Node）。模型可以直接调用，比反复让模型推理更可靠。
- `assets/` — **静态素材**（模板、字体、图片、示例文件），运行时复制/引用，不被模型阅读。

示例：

> 调用 `scripts/calc.py <args>` 计算结果；查表见 `references/lookup.md`；模板在 `assets/template.docx`。

## 输出格式

描述最终交付物的形式（Markdown、代码块、文件、JSON…）。

## 注意事项

- 边界条件、易错点、安全约束
