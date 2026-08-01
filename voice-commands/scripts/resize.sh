#!/bin/bash
# Usage: resize.sh <+50|-50> <times>
DIR="${1:-+50}"
TIMES="${2:-1}"
AERO="/opt/homebrew/bin/aerospace"
if [[ ! -x "$AERO" ]]; then
  AERO="$(command -v aerospace)"
fi
for ((i=0; i<TIMES; i++)); do
  "$AERO" resize smart "$DIR" || exit 1
  sleep 0.05
done
