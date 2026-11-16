#!/bin/bash
# Usage: ./scripts/prepare-assets.sh "/path/to/her/numbered/PDF/folder"
# Copies PDFs into public/assets/<folder>/<file>, stripping the leading
# digits and hyphen, and lower-casing. Originals are left untouched.
set -e
SRC="$1"
[ -d "$SRC" ] || { echo "Source folder not found: $SRC"; exit 1; }
strip() { echo "$1" | sed -E 's/^[0-9]+-//' | tr 'A-Z' 'a-z'; }
for d in "$SRC"/*/; do
  base=$(basename "$d")
  clean=$(strip "$base")
  mkdir -p "public/assets/$clean"
  for f in "$d"*.pdf; do
    [ -e "$f" ] || continue
    fb=$(basename "$f")
    cp "$f" "public/assets/$clean/$(strip "$fb")"
    echo "$base/$fb  ->  $clean/$(strip "$fb")"
  done
done
