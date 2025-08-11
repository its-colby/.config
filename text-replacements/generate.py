#!/usr/bin/env python3

import json
import os
import argparse
import plistlib


def load_json_files(directory):
    data = {}
    if not os.path.exists(directory):
        return data
    
    for filename in os.listdir(directory):
        if filename.endswith('.json'):
            with open(os.path.join(directory, filename), 'r') as f:
                data.update(json.load(f))
    return data


def generate_plist(data, prefix):
    result = []
    for name, item in data.items():
        shortcuts = item["shortcut"] if isinstance(item["shortcut"], list) else [item["shortcut"]]
        for shortcut in shortcuts:
            result.append({"phrase": item["body"], "shortcut": prefix + shortcut})
    return result


def generate_vscode(data, prefix):
    result = {}
    for name, item in data.items():
        shortcuts = item["shortcut"] if isinstance(item["shortcut"], list) else [item["shortcut"]]
        for i, shortcut in enumerate(shortcuts):
            key = f"{name}" if i == 0 else f"{name} ({shortcut})"
            result[key] = {
                "scope": "", 
                "prefix": prefix + shortcut, 
                "body": [item["body"]], 
                "description": f"{name} - {item['body']}"
            }
    return result


def generate_neovim(data, prefix):
    """Generate Neovim abbreviations Lua config"""
    lines = [
        "-- Text abbreviations and expansions",
        "-- Auto-generated from text-replacements",
        "local M = {}",
        "",
        "-- Helper function to set abbreviations",
        "local function set_abbrev(lhs, rhs)",
        '    vim.cmd(string.format("iabbrev %s %s", lhs, rhs))',
        "end",
        "",
        "function M.setup()",
    ]
    
    # Group by categories based on JSON filenames
    categories = {}
    for name, item in data.items():
        # Try to determine category from the data structure or use "general"
        category = getattr(item, 'category', 'general')
        if category not in categories:
            categories[category] = []
        
        shortcuts = item["shortcut"] if isinstance(item["shortcut"], list) else [item["shortcut"]]
        for shortcut in shortcuts:
            # Escape quotes in the replacement text
            body = item["body"].replace('"', '\\"').replace("'", "\\'")
            categories[category].append((prefix + shortcut, body, name))
    
    # Add all abbreviations
    lines.append("    -- Text abbreviations")
    for name, item in data.items():
        shortcuts = item["shortcut"] if isinstance(item["shortcut"], list) else [item["shortcut"]]
        for shortcut in shortcuts:
            # Escape quotes and backslashes in the replacement text
            body = item["body"].replace('\\', '\\\\').replace('"', '\\"')
            comment = f"    -- {name}: {item['body'][:30]}{'...' if len(item['body']) > 30 else ''}"
            abbrev_line = f'    set_abbrev("{prefix}{shortcut}", "{body}")'
            lines.append(comment)
            lines.append(abbrev_line)
    
    lines.extend([
        "end",
        "",
        "return M"
    ])
    
    return '\n'.join(lines)


def main():
    parser = argparse.ArgumentParser(description='Generate text replacement files')
    parser.add_argument('-p', '--prefix', default='j', help='Prefix (default: j)')
    parser.add_argument('-o', '--output', help='Output file')
    parser.add_argument('-f', '--format', choices=['plist', 'vscode', 'neovim'], help='Format (generates all if not specified)')
    parser.add_argument('-d', '--directory', default='json-replacements', help='JSON directory')
    parser.add_argument('--nvim-config', default='../nvim/lua/config/abbreviations.lua', help='Neovim config output path')
    
    args = parser.parse_args()
    data = load_json_files(args.directory)
    
    # Generate based on format specification
    if args.format:
        # Generate only the specified format
        if args.format == 'plist':
            output = generate_plist(data, args.prefix)
            output_file = args.output or 'text-replacements.plist'
            with open(output_file, 'wb') as f:
                plistlib.dump(output, f)
            print(f"Generated {len(output)} entries to {output_file}")
            
        elif args.format == 'vscode':
            output = generate_vscode(data, args.prefix)
            output_file = args.output or 'global.code-snippets'
            with open(output_file, 'w') as f:
                json.dump(output, f, indent='\t', ensure_ascii=False)
            print(f"Generated {len(output)} entries to {output_file}")
            
        elif args.format == 'neovim':
            output = generate_neovim(data, args.prefix)
            output_file = args.output or args.nvim_config
            with open(output_file, 'w') as f:
                f.write(output)
            # Count the number of abbreviations
            abbrev_count = sum(len(item["shortcut"]) if isinstance(item["shortcut"], list) else 1 for item in data.values())
            print(f"Generated {abbrev_count} abbreviations to {output_file}")
    else:
        # Generate all formats
        plist_output = generate_plist(data, args.prefix)
        vscode_output = generate_vscode(data, args.prefix)
        neovim_output = generate_neovim(data, args.prefix)
        
        plist_file = args.output if args.output else 'text-replacements.plist'
        vscode_file = 'global.code-snippets'
        neovim_file = args.nvim_config
        
        with open(plist_file, 'wb') as f:
            plistlib.dump(plist_output, f)
        
        with open(vscode_file, 'w') as f:
            json.dump(vscode_output, f, indent='\t', ensure_ascii=False)
            
        with open(neovim_file, 'w') as f:
            f.write(neovim_output)
        
        abbrev_count = sum(len(item["shortcut"]) if isinstance(item["shortcut"], list) else 1 for item in data.values())
        print(f"Generated {len(plist_output)} entries to {plist_file}")
        print(f"Generated {len(vscode_output)} entries to {vscode_file}")
        print(f"Generated {abbrev_count} abbreviations to {neovim_file}")


if __name__ == '__main__':
    main() 