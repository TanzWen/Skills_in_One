# 在 Gemini Gem 中使用

Gemini Gem 的"Instructions"字段就是 system prompt，把导出后的 skill 内容粘贴进去即可。

## 步骤

1. 导出 skill 为纯文本：
   ```bash
   bash scripts/export.sh skills/<skill-name> --with-resources | pbcopy
   ```
2. 打开 [gemini.google.com](https://gemini.google.com) → Gems → **新建 Gem**。
3. 给 Gem 起名（建议与 skill 同名）。
4. 把剪贴板内容粘贴到 **Instructions**。
5. 保存。

## 一 Gem 一 Skill vs. 多 Skill 合并

- **推荐一 Gem 一 Skill**：触发更准，Gem 名字本身就是入口。
- 如果要把多个 skill 塞进一个 Gem，建议加一段"路由说明"在前面，告诉模型按用户输入选择走哪个流程。

## 注意

- Gemini 不会自动读取外部文件，所以必须用 `--with-resources` 把参考内容内联进来。
- Instructions 有长度上限（具体随 Gemini 版本变动），过长的 skill 需要精简。
- 写 `description` 时假设它**不会**被 Gemini 用到 —— 在 Gem 里靠 Gem 名字 + Instructions 开头的"何时使用"小节路由。
