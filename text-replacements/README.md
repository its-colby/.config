# Text Replacements Generator

## Installation

Install dependencies:
```bash
brew install python3
brew install --cask visual-studio-code  # or: brew install --cask cursor
```

## Usage

Generate text replacements:
```bash
python3 generate.py [options]
```

### Options
- `--prefix, -p`: Prefix for shortcuts (default: 'j')
- `--output, -o`: Output file path
- `--format, -f`: Output format: 'plist' or 'vscode' (generates both if not specified)
- `--directory, -d`: JSON files directory (default: 'json-replacements')

### Examples
```bash
python3 generate.py                          # Generate both files
python3 generate.py --prefix "jj"            # Generate both files with custom prefix
python3 generate.py --format plist           # Generate only plist file
python3 generate.py --format vscode          # Generate only vscode file
```

## Setup

### VS Code Snippets
1. Generate: `python3 generate.py` (or `python3 generate.py --format vscode`)
2. Copy `global.code-snippets` to `~/.vscode/snippets/`
3. Restart VS Code

### macOS Text Replacements
1. Generate: `python3 generate.py` (or `python3 generate.py --format plist`)
2. Open System Settings → Keyboard → Text Replacements
3. Drag `text-replacements.plist` into the window 