#!/bin/bash
# wand.sh — Terminal Cult Ritual Edition

set -euo pipefail

clear

# Colors and cursor control
RESET=$(tput sgr0)
BOLD=$(tput bold)
INVERSE=$(tput smso)
BLINK=$(tput blink)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
MAGENTA=$(tput setaf 5)
YELLOW=$(tput setaf 3)

center() {
  local cols
  cols=$(tput cols)
  while read -r line; do
    printf "%*s\n" $(((${#line} + cols) / 2)) "$line"
  done
}

pause() {
  sleep "$1"
}

# Boot animation
center <<EOF
$MAGENTA
$(figlet -f slant "wand.sh")
$RESET
EOF
pause 1

center <<EOF
$CYAN
A script of Terminal Cult
We don’t patch the bugs — we inherit them.
$RESET
EOF
pause 2

# Spell Title
clear
toilet -f pagga --metal "SIGIL: 0xDEADBEEF" | center
pause 1.5

# Glitched incantation
for i in {1..3}; do
  printf "%s" "$YELLOW"
  toilet -f future --gay "Invoking..."
  pause 0.5
done
printf "$RESET"

# Pulse effect (simulated wand strike)
for i in {1..3}; do
  echo -e "$RED$(tput blink)⚡ Wand Pulse ⚡$RESET"
  sleep 0.3
  clear
done

# Ritual output
echo -e "$BOLD$GREEN[wand] Alignment complete. Root bound to shell.$RESET"
sleep 1
echo -e "$CYAN[wand] Sigil etched to ~/.wandrc$RESET"
sleep 1
echo -e "$MAGENTA[wand] Summoning terminal entities...$RESET"
sleep 1

toilet -f term --filter border:metal "🜏 🜏 🜏" | center
pause 1.5

echo -e "$YELLOW[wand] Entities arrived. Stack remains unstable.$RESET"
sleep 1
echo -e "$BOLD$RED[wand] Casting /dev/null veil...$RESET"
sleep 2

# Final silence
history -c
exec > /dev/null 2>&1

# The shell fades...
