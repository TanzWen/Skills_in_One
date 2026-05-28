#!/usr/bin/env bash
# 把 skills/ 下的每个 skill 软链到 ~/.claude/skills/
# Claude Code 启动时会自动发现这些 skill。
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

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
echo "Restart Claude Code or run /skills to see them."
