#!/usr/bin/env bash
# 把 skills/ 下的每个 skill 软链到 ~/.agents/skills/（Codex 用户级 skill 目录）。
# Codex 启动时会自动扫描该目录。如已运行 codex，需重启生效。
#
# 用法:
#   bash scripts/install-codex.sh              # 装到 ~/.agents/skills/
#   bash scripts/install-codex.sh --project    # 装到 当前目录/.agents/skills/（项目级）
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

if [ "${1:-}" = "--project" ]; then
  TARGET="$(pwd)/.agents/skills"
else
  TARGET="${CODEX_SKILLS_DIR:-$HOME/.agents/skills}"
fi

mkdir -p "$TARGET"

linked=0
for skill in "$ROOT"/skills/*/; do
  [ -d "$skill" ] || continue
  name="$(basename "$skill")"
  [ -f "$skill/SKILL.md" ] || { echo "skip $name (no SKILL.md)"; continue; }

  link="$TARGET/$name"
  if [ -L "$link" ] || [ -e "$link" ]; then
    rm -rf "$link"
  fi
  ln -s "$skill" "$link"
  echo "linked: $name -> $link"
  linked=$((linked + 1))
done

echo ""
echo "Done. $linked skill(s) linked into $TARGET"
echo "Restart Codex if it's already running."
