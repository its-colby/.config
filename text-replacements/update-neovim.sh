#!/bin/bash

# Update Neovim abbreviations from text replacements
echo "Updating Neovim abbreviations..."

cd "$(dirname "$0")"
python3 generate.py -f neovim

echo "✅ Neovim abbreviations updated!"
echo "💡 Restart Neovim to load the new abbreviations."