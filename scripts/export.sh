#!/usr/bin/env bash
# 把一个 skill 导出成可直接粘贴的 prompt（剥离 YAML frontmatter）。
# 用法: bash scripts/export.sh skills/<skill-name> [--with-resources]
#
# 输出到 stdout，可以 | pbcopy 直接复制到剪贴板：
#   bash scripts/export.sh skills/foo | pbcopy
set -euo pipefail

SKILL_DIR="${1:-}"
WITH_RES="${2:-}"

if [ -z "$SKILL_DIR" ] || [ ! -d "$SKILL_DIR" ]; then
  echo "Usage: $0 <skill-dir> [--with-resources]" >&2
  exit 1
fi

SRC="$SKILL_DIR/PROMPT.md"
[ -s "$SRC" ] && grep -q '[^[:space:]>]' "$SRC" || SRC="$SKILL_DIR/SKILL.md"

if [ ! -f "$SRC" ]; then
  echo "No SKILL.md or PROMPT.md in $SKILL_DIR" >&2
  exit 1
fi

# 剥离 YAML frontmatter (--- 到下一个 ---)
awk '
  BEGIN { in_fm = 0; done_fm = 0 }
  NR == 1 && /^---[[:space:]]*$/ { in_fm = 1; next }
  in_fm && /^---[[:space:]]*$/ { in_fm = 0; done_fm = 1; next }
  in_fm { next }
  { print }
' "$SRC"

# 可选：拼接 resources/ 下的文件作为附录
if [ "$WITH_RES" = "--with-resources" ] && [ -d "$SKILL_DIR/resources" ]; then
  for f in "$SKILL_DIR"/resources/*; do
    [ -f "$f" ] || continue
    echo ""
    echo "---"
    echo "## Resource: $(basename "$f")"
    echo ""
    cat "$f"
  done
fi
