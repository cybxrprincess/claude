#!/usr/bin/env bash
# Build .claude/settings.json from words/*.txt and tips.txt.
# Usage: ./build.sh [category ...]   (default: every category)
# Set MODE=replace to use only these words instead of adding to the defaults.
set -euo pipefail
cd "$(dirname "$0")"
cats=("$@")
[ ${#cats[@]} -gt 0 ] || cats=($(basename -s .txt words/*.txt))
files=(); for c in "${cats[@]}"; do files+=("words/$c.txt"); done
jq -n \
  --arg mode "${MODE:-append}" \
  --rawfile words <(cat "${files[@]}") \
  --rawfile tips tips.txt '{
    spinnerVerbs: {mode: $mode, verbs: ($words | split("\n") | map(select(length>0)) | unique)},
    spinnerTipsOverride: {label: "Vibe check", excludeDefault: false,
      tips: ($tips | split("\n") | map(select(length>0)))}
  }' > .claude/settings.json
echo "Built .claude/settings.json from: ${cats[*]}"
