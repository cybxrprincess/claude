#!/usr/bin/env bash
# Merge the spinner words into your user-level Claude Code settings.
set -euo pipefail
cd "$(dirname "$0")"
target="$HOME/.claude/settings.json"
mkdir -p "$(dirname "$target")"
[ -f "$target" ] || echo '{}' > "$target"
jq --slurpfile src .claude/settings.json '. + {spinnerVerbs: $src[0].spinnerVerbs}' "$target" > "$target.tmp"
mv "$target.tmp" "$target"
echo "Installed $(jq '.spinnerVerbs.verbs | length' "$target") spinner words into $target. Restart Claude Code!"
