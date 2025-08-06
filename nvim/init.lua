vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Line length and visual guides
vim.opt.textwidth = 80        -- Auto-wrap at 80 characters
vim.opt.colorcolumn = "80"    -- Visual line at column 80
vim.opt.wrap = true           -- Wrap long lines visually
vim.opt.linebreak = true      -- Break at word boundaries

-- Indentation settings
vim.opt.tabstop = 4           -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4        -- Number of spaces for auto-indent
vim.opt.softtabstop = 4       -- Number of spaces for <Tab> and <BS>
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.autoindent = true     -- Copy indent from current line
vim.opt.smartindent = true    -- Smart auto-indenting

-- Additional indentation helpers
vim.opt.smarttab = true       -- Smart tab behavior
vim.opt.shiftround = true     -- Round indent to multiple of shiftwidth

-- Search behavior
vim.opt.ignorecase = true     -- Case insensitive search
vim.opt.smartcase = true      -- Case sensitive if uppercase present
vim.opt.incsearch = true      -- Show matches as you type
vim.opt.hlsearch = true       -- Highlight search results

-- UI enhancements
vim.opt.cursorline = true     -- Highlight current line
vim.opt.scrolloff = 8         -- Keep 8 lines visible when scrolling
vim.opt.sidescrolloff = 8     -- Keep 8 columns visible when scrolling

-- Editing behavior
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard
vim.opt.undofile = true       -- Persistent undo across sessions


vim.keymap.set({'n', 'v'}, 'a', 'j', { desc = 'Move down 1 line' })
vim.keymap.set({'n', 'v'}, 's', 'k', { desc = 'Move up 1 line' })
vim.keymap.set({'n', 'v'}, 'd', 'h', { desc = 'Move left 1 character' })
vim.keymap.set({'n', 'v'}, 'f', 'l', { desc = 'Move right 1 character' })
vim.keymap.set({'n', 'v'}, 'g', '%', { desc = 'Jump to matching paren' })

vim.keymap.set({'n', 'v'}, 'q', '^', { desc = 'Move to first non-blank char' })
vim.keymap.set({'n', 'v'}, 'w', 'g_', { desc = 'Move to last non-blank char' })
vim.keymap.set({'n', 'v'}, 'e', 'b', { desc = 'Move to beg. of prev. word' })
vim.keymap.set({'n', 'v'}, 'r', 'e', { desc = 'Move to end of next word' })

vim.keymap.set({'n', 'v'}, 'x', 'G', { desc = 'Move to last line' })
vim.keymap.set({'n', 'v'}, 'z', 'gg', { desc = 'Move to first line' })
vim.keymap.set({'n', 'v'}, 'c', '{', { desc = 'Move to prev. paragraph' })
vim.keymap.set({'n', 'v'}, 'v', '}', { desc = 'Move to next paragraph' })

vim.keymap.set({'n', 'v'}, 'j', 'i', { desc = 'Enter insertion mode' })
vim.keymap.set('n', 'k', 'v', { desc = 'Enter visual/selection mode' })

vim.keymap.set({'n', 'v'}, 'u', '<Esc>u', { desc = 'Undo' })
vim.keymap.set({'n', 'v'}, 'i', '<Esc><C-r>', { desc = 'Redo' })
vim.keymap.set({'n', 'v'}, 'p', '>gv', { desc = 'Indent and reselect' })
vim.keymap.set({'n', 'v'}, 'o', '<gv', { desc = 'Deindent and reselect' })

vim.keymap.set('n', '<leader>j', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>k', ':wq<CR>', { desc = 'Save and quit' })
vim.keymap.set('n', '<leader>l', ':q<CR>', { desc = 'Quit' })

vim.keymap.set({'n', 'v'}, '<C-v>', 'p', { desc = 'Paste' })
vim.keymap.set({'n', 'v'}, '<C-x>', 'd', { desc = 'Cut selection' })
vim.keymap.set({'n', 'v'}, '<C-c>', 'y', { desc = 'Copy selection' })

-- search, replace
-- map mac shortcuts for insertion mode

vim.keymap.set('n', 'lq', '1k', { desc = 'Jump 1 line up' })
vim.keymap.set('n', 'lw', '2k', { desc = 'Jump 2 lines up' })
vim.keymap.set('n', 'le', '3k', { desc = 'Jump 3 lines up' })
vim.keymap.set('n', 'lr', '4k', { desc = 'Jump 4 lines up' })
vim.keymap.set('n', 'lt', '5k', { desc = 'Jump 5 lines up' })
vim.keymap.set('n', 'ly', '6k', { desc = 'Jump 6 lines up' })
vim.keymap.set('n', 'lu', '7k', { desc = 'Jump 7 lines up' })
vim.keymap.set('n', 'li', '8k', { desc = 'Jump 8 lines up' })
vim.keymap.set('n', 'lo', '9k', { desc = 'Jump 9 lines up' })
vim.keymap.set('n', 'lp', '10k', { desc = 'Jump 10 lines up' })

vim.keymap.set('n', 'lz', '1j', { desc = 'Jump 1 line down' })
vim.keymap.set('n', 'lx', '2j', { desc = 'Jump 2 lines down' })
vim.keymap.set('n', 'lc', '3j', { desc = 'Jump 3 lines down' })
vim.keymap.set('n', 'lv', '4j', { desc = 'Jump 4 lines down' })
vim.keymap.set('n', 'lb', '5j', { desc = 'Jump 5 lines down' })
vim.keymap.set('n', 'ln', '6j', { desc = 'Jump 6 lines down' })
vim.keymap.set('n', 'lm', '7j', { desc = 'Jump 7 lines down' })
vim.keymap.set('n', 'l,', '8j', { desc = 'Jump 8 lines down' })
vim.keymap.set('n', 'l.', '9j', { desc = 'Jump 9 lines down' })
vim.keymap.set('n', 'l/', '10j', { desc = 'Jump 10 lines down' })

vim.keymap.set('n', '<S-D-]>', ':tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<S-D-[>', ':tabprevious<CR>', { desc = 'Previous tab' })

require("config.lazy")
