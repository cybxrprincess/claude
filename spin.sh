#!/usr/bin/env bash
# Animated demo of a random spinner style + random word, with color.
# Usage: ./spin.sh [category]   (category = a file in words/, default: any)
set -euo pipefail
cd "$(dirname "$0")"
declare -A FRAMES INTERVAL
FRAMES[dots]="⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏";            INTERVAL[dots]=0.08
FRAMES[star]="✶ ✸ ✹ ✺ ✹ ✷";                      INTERVAL[star]=0.07
FRAMES[arc]="◜ ◠ ◝ ◞ ◡ ◟";                       INTERVAL[arc]=0.10
FRAMES[moon]="🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘";              INTERVAL[moon]=0.08
FRAMES[hearts]="💛 💙 💜 💚 💗";                   INTERVAL[hearts]=0.10
FRAMES[bar]="[    ] [=   ] [==  ] [=== ] [====] [ ===] [  ==] [   =]"; INTERVAL[bar]=0.08
styles=("${!FRAMES[@]}"); style=${styles[RANDOM % ${#styles[@]}]}
read -ra frames <<< "${FRAMES[$style]}"
src=(words/*.txt); [ $# -gt 0 ] && src=("words/$1.txt")
word=$(cat "${src[@]}" | shuf -n1)
colors=(35 36 33 95 96); c=${colors[RANDOM % ${#colors[@]}]}
for ((i = 0; i < 24; i++)); do
  printf '\r\033[%sm%s %s...\033[0m  ' "$c" "${frames[i % ${#frames[@]}]}" "$word"
  sleep "${INTERVAL[$style]}"
done
printf '\r✨ %s... done!  (style: %s)\n' "$word" "$style"
