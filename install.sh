#!/usr/bin/env bash
# Links the kit into ~/.claude so every Claude Code session picks it up.
# Safe to re-run. Existing non-link files are moved aside to *.bak-<timestamp>.
set -euo pipefail

KIT="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
STAMP="$(date +%Y%m%d%H%M%S)"

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -L "$dest" ]; then
    rm "$dest"
  elif [ -e "$dest" ]; then
    mv "$dest" "$dest.bak-$STAMP"
    echo "Moved existing $dest to $dest.bak-$STAMP"
  fi
  ln -s "$src" "$dest"
  echo "Linked $dest -> $src"
}

link "$KIT/skills/ticket" "$CLAUDE_DIR/skills/ticket"

echo "Done. New project: cp \"$KIT/templates/project-CLAUDE.md\" ./CLAUDE.md and fill it in."
