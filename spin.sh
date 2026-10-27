#!/usr/bin/env bash
# Print a random spinner word, with a tiny spinner for flavor.
set -euo pipefail
cd "$(dirname "$0")"
word=$(shuf -n1 words.txt)
frames='|/-\'
for i in $(seq 0 15); do
  printf '\r%s %s...' "${frames:i%4:1}" "$word"
  sleep 0.08
done
printf '\r✨ %s... done!\n' "$word"
