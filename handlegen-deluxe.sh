#!/bin/bash
# ✨ Terminal Cult Handle Generator (Deluxe Edition)

set -euo pipefail

# Dependencies check
for cmd in figlet lolcat; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing dependency: $cmd"
    exit 1
  fi
done

ADJ=(
  ghost sigil core ptrace null fork seg panic hex
  mount init loop bg daemon wand sync sig
)

NOUN=(
  ritual glitch punk .exe wizard ghost 404 boy
  bomb spawn whisper dancer veil fuzz curse trace
  dump shock script seer shard flame
)

generate_name() {
  local a b
  a=${ADJ[$RANDOM % ${#ADJ[@]}]}
  b=${NOUN[$RANDOM % ${#NOUN[@]}]}
  echo "$a$b"
}

clear
echo -e "\n🔮 Welcome to the Terminal Cult Handle Forge 🔮\n" | lolcat
sleep 0.5

while true; do
  NAME=$(generate_name)
  figlet -f slant "$NAME" | lolcat
  echo -e "\nPress [Enter] to summon another. Type 'q' to exit.\n"
  read -r choice
  [[ "$choice" == "q" || "$choice" == "Q" ]] && break
  clear
done

echo -e "\n🧙‍♂️ You are the spell. Farewell, operator.\n" | lolcat