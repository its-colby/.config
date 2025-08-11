vim.g.mapleader = " "
vim.g.maplocalleader = "h"

-- Increase timeout for leader key sequences
vim.opt.timeoutlen = 2000  -- Wait 1 second for leader key sequences

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

vim.keymap.set({'n', 'v'}, '<D-v>', 'p', { desc = 'Paste' })
vim.keymap.set({'n', 'v'}, '<D-x>', 'd', { desc = 'Cut selection' })
vim.keymap.set({'n', 'v'}, '<D-c>', 'y', { desc = 'Copy selection' })

-- Mac-style insert mode shortcuts
-- Basic clipboard operations
-- vim.keymap.set('i', '<D-c>', '<Esc>yyi', { desc = 'Copy line in insert mode' })
-- vim.keymap.set('i', '<D-x>', '<Esc>ddi', { desc = 'Cut line in insert mode' })
vim.keymap.set('i', '<D-v>', '<C-r>+', { desc = 'Paste from system clipboard' })

-- Undo/Redo
vim.keymap.set('i', '<D-z>', '<Esc>ui', { desc = 'Undo in insert mode' })
vim.keymap.set('i', '<D-S-z>', '<Esc><C-r>i', { desc = 'Redo in insert mode' })

-- Text navigation in insert mode (Unix-style)
vim.keymap.set('i', '<C-a>', '<C-o>^', { desc = 'Move to beginning of line' })
vim.keymap.set('i', '<C-e>', '<Esc>$a', { desc = 'Move to end of line' })
vim.keymap.set('i', '<M-b>', '<Esc>bi', { desc = 'Move word backward' })
vim.keymap.set('i', '<M-f>', '<Esc>ea', { desc = 'Move word forward' })

-- Text deletion in insert mode
vim.keymap.set('i', '<C-U>', '<Esc>d^i', { desc = 'Delete to beginning of line' })
vim.keymap.set('i', '<D-Delete>', '<Esc>d$a', { desc = 'Delete to end of line' })
vim.keymap.set('i', '<M-BS>', '<C-w>', { desc = 'Delete word backward' })
vim.keymap.set('i', '<M-Delete>', '<C-o>dw', { desc = 'Delete word forward' })

-- Line operations
-- vim.keymap.set('i', '<D-Return>', '<Esc>o', { desc = 'New line below' })
-- vim.keymap.set('i', '<D-S-Return>', '<Esc>O', { desc = 'New line above' })

-- Text selection in insert mode enter visual mode then return to insert)
-- vim.keymap.set('i', '<S-D-Left>', '<Esc>v^', { desc = 'Select to beginning of line' })
-- vim.keymap.set('i', '<S-D-Right>', '<Esc>v$', { desc = 'Select to end of line' })
-- vim.keymap.set('i', '<M-S-Left>', '<Esc>vb', { desc = 'Select word backward' })
-- vim.keymap.set('i', '<M-S-Right>', '<Esc>vw', { desc = 'Select word forward' })
-- vim.keymap.set('i', '<S-Left>', '<Esc>vh', { desc = 'Select character left' })
-- vim.keymap.set('i', '<S-Right>', '<Esc>vl', { desc = 'Select character right' })
-- vim.keymap.set('i', '<S-Up>', '<Esc>vk', { desc = 'Select line up' })
-- vim.keymap.set('i', '<S-Down>', '<Esc>vj', { desc = 'Select line down' })

-- File operations
vim.keymap.set('i', '<D-s>', '<Esc>:w<CR>i', { desc = 'Save file in insert mode' })

-- Indent/dedent current line in insert mode
vim.keymap.set('i', '<D-[>', '<C-o><<', { desc = 'Dedent current line in insert mode' })
vim.keymap.set('i', '<D-]>', '<C-o>>>', { desc = 'Indent current line in insert mode' })

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

-- Toggle commenting with Cmd+/ in visual mode
vim.keymap.set('v', '<D-/>', '<Plug>(comment_toggle_linewise_visual)', { desc = 'Toggle comment selection' })

require("config.lazy")
require("config.abbreviations").setup()
