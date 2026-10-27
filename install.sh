#!/usr/bin/env bash
# Merge the spinner words and tips into your user-level Claude Code settings.
set -euo pipefail
cd "$(dirname "$0")"
target="$HOME/.claude/settings.json"
mkdir -p "$(dirname "$target")"
[ -f "$target" ] || echo '{}' > "$target"
jq --slurpfile src .claude/settings.json '. + {spinnerVerbs: $src[0].spinnerVerbs, spinnerTipsOverride: $src[0].spinnerTipsOverride}' "$target" > "$target.tmp"
mv "$target.tmp" "$target"
echo "Installed $(jq '.spinnerVerbs.verbs | length' "$target") spinner words and tips into $target. Restart Claude Code!"
