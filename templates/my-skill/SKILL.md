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

如需引用脚本或参考资料，放在 `resources/` 下，并在此用相对路径引用：

> 参考 `resources/notes.md` 中的规则表。

## 输出格式

描述最终交付物的形式（Markdown、代码块、文件、JSON…）。

## 注意事项

- 边界条件、易错点、安全约束
