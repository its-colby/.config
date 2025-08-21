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
vim.opt.formatoptions:append("t")  -- Enable auto-wrap text using textwidth

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

-- A S D F = navigate characters
vim.keymap.set({'n', 'v'}, 'a', 'j', { desc = 'Move down 1 line' })
vim.keymap.set({'n', 'v'}, 's', 'k', { desc = 'Move up 1 line' })
vim.keymap.set({'n', 'v'}, 'd', 'h', { desc = 'Move left 1 character' })
vim.keymap.set({'n', 'v'}, 'f', 'l', { desc = 'Move right 1 character' })


-- Q W E R = navigate lines and words
vim.keymap.set({'n', 'v'}, 'q', '^', { desc = 'Move to first non-blank char' })
vim.keymap.set('i', '<C-a>', '<C-o>^', { desc = 'Move to beginning of line' })

vim.keymap.set({'n', 'v'}, 'w', 'g_', { desc = 'Move to last non-blank char' })
vim.keymap.set('i', '<C-e>', '<Esc>$a', { desc = 'Move to end of line' })

vim.keymap.set({'n', 'v'}, 'e', 'b', { desc = 'Move to beg. of prev. word' })
vim.keymap.set('i', '<M-b>', '<Esc>bi', { desc = 'Move word backward' })

vim.keymap.set({'n', 'v'}, 'r', 'e', { desc = 'Move to end of next word' })
vim.keymap.set('i', '<M-f>', '<Esc>ea', { desc = 'Move word forward' })


-- Z X C V = navigate entire file and paragraphs
vim.keymap.set({'n', 'v'}, 'z', 'gg', { desc = 'Move to first line' })
vim.keymap.set({'n', 'v'}, 'x', 'G', { desc = 'Move to last line' })
vim.keymap.set({'n', 'v'}, 'c', '{', { desc = 'Move to prev. paragraph' })
vim.keymap.set({'n', 'v'}, 'v', '}', { desc = 'Move to next paragraph' })

vim.keymap.set({'n', 'v'}, '<D-x>', 'd', { desc = 'Cut selection' })
vim.keymap.set({'n', 'v'}, '<D-c>', 'y', { desc = 'Copy selection' })
vim.keymap.set('i', '<D-v>', '<C-r>+', { desc = 'Paste from system clipboard' })
vim.keymap.set({'n', 'v'}, '<D-v>', 'p', { desc = 'Paste' })


-- T G B = navigate misc.
vim.keymap.set({'n', 'v'}, 'g', '%', { desc = 'Jump to matching paren' })


-- J K L SEIMCOLON = activate frequently used commands
vim.keymap.set('n', '<leader>j', ':w<CR>', { desc = 'Save file' })
vim.keymap.set({'n', 'v'}, 'j', 'i', { desc = 'Enter insertion mode' })

vim.keymap.set('n', '<leader>k', ':wq<CR>', { desc = 'Save and quit' })
vim.keymap.set('n', 'k', 'v', { desc = 'Enter visual mode' })

vim.keymap.set('n', '<leader>l', ':q<CR>', { desc = 'Quit' })
-- L is also reserved for navigating line numbers. See further below

-- Enter and Delete in normal mode
vim.keymap.set('n', '<CR>', 'i<CR><Esc>', { desc = 'Insert newline at cursor' })
vim.keymap.set('n', '<BS>', 'i<Right><BS><Esc>', { desc = 'Delete character at cursor' })


-- U I O P 
vim.keymap.set({'n', 'v'}, 'u', '<Esc>u', { desc = 'Undo' })
vim.keymap.set('i', '<D-z>', '<Esc>ui', { desc = 'Undo' })

vim.keymap.set({'n', 'v'}, 'i', '<Esc><C-r>', { desc = 'Redo' })
vim.keymap.set('i', '<D-S-z>', '<Esc><C-r>i', { desc = 'Redo' })

vim.keymap.set('n', 'p', '>>', { desc = 'Indent line' })
vim.keymap.set('v', 'p', '>gv', { desc = 'Indent selection' })
vim.keymap.set('i', '<M-[>', '<C-o><<', { desc = 'De-indent' })

vim.keymap.set('n', 'o', '<<', { desc = 'De-indent line' })
vim.keymap.set('v', 'o', '<gv', { desc = 'De-indent selection' })
vim.keymap.set('i', '<M-]>', '<C-o>>>', { desc = 'Indent' })


-- M EXCLAMATION PERIOD @ = delete lines and words
vim.keymap.set('i', '<C-U>', '<Esc>v0"_di', { desc = 'Delete to beginning of line' })
vim.keymap.set('i', '<D-Delete>', '<Esc>"_d$a', { desc = 'Delete to end of line' })
vim.keymap.set('i', '<M-BS>', '<C-w>', { desc = 'Delete word backward' })
vim.keymap.set('i', '<M-Delete>', '<C-o>dw', { desc = 'Delete word forward' })

vim.keymap.set('n', '.', 'v0d<Esc>', { desc = 'Delete to beginning of line' })
vim.keymap.set('n', 'm', 'db', { desc = 'Delete word backward' })
vim.keymap.set('n', ',', 'dw', { desc = 'Delete word forward' })
vim.keymap.set('n', '@', 'd$', { desc = 'Delete to end of line', noremap = true, silent = true })


-- Y H N
vim.keymap.set('v', '<D-/>', '<Plug>(comment_toggle_linewise_visual)', { desc = 'Toggle comment selection' })


-- Modal number navigation system
local number_buffer = ""
local in_number_mode = false
local temp_keymaps = {}

-- Function to clear temporary keymaps
local function clear_temp_keymaps()
  for _, keymap_id in ipairs(temp_keymaps) do
    pcall(vim.keymap.del, 'n', keymap_id.key, { buffer = 0 })
  end
  temp_keymaps = {}
end

-- Function to build numbers from key presses
local function build_number(digit)
  number_buffer = number_buffer .. digit
  -- Show the current number being built
  vim.api.nvim_echo({{"Number: " .. number_buffer, "MoreMsg"}}, false, {})
end

-- Function to execute movement with built number
local function execute_movement(movement)
  local count = tonumber(number_buffer) or 1
  vim.cmd("normal! " .. count .. movement)
  -- Reset state
  number_buffer = ""
  in_number_mode = false
  -- Clear the echo
  vim.api.nvim_echo({{"", "Normal"}}, false, {})
  -- Clear temporary keymaps
  clear_temp_keymaps()
end

-- Function to enter number mode
local function enter_number_mode()
  in_number_mode = true
  number_buffer = ""
  vim.api.nvim_echo({{"Number mode - build your number...", "MoreMsg"}}, false, {})
  
  -- Number building keys (z=1, x=2, c=3, v=4, b=5, n=6, m=7, ,=8, .=9, @=0)
  local number_maps = {
    z = '1', x = '2', c = '3', v = '4', b = '5',
    n = '6', m = '7', [','] = '8', ['.'] = '9', ['@'] = '0'
  }
  
  -- Create temporary keymaps for number building
  for key, digit in pairs(number_maps) do
    vim.keymap.set('n', key, function() build_number(digit) end, { buffer = 0, nowait = true })
    table.insert(temp_keymaps, {key = key})
  end
  
  -- Movement finisher keys using your existing movement system
  local movement_keys = {
    {key = 'a', movement = 'j'},   -- down
    {key = 's', movement = 'k'},   -- up  
    {key = 'd', movement = 'h'},   -- left
    {key = 'f', movement = 'l'},   -- right
    {key = 'r', movement = 'e'},   -- word end
    {key = 'e', movement = 'b'},   -- word back
  }
  
  for _, mapping in ipairs(movement_keys) do
    vim.keymap.set('n', mapping.key, function() execute_movement(mapping.movement) end, { buffer = 0, nowait = true })
    table.insert(temp_keymaps, {key = mapping.key})
  end
  
  -- Escape key to exit number mode (optional, since it auto-exits after movement)
  vim.keymap.set('n', '<Esc>', function() 
    number_buffer = ""
    in_number_mode = false
    vim.api.nvim_echo({{"", "Normal"}}, false, {})
    clear_temp_keymaps()
  end, { buffer = 0, nowait = true })
  table.insert(temp_keymaps, {key = '<Esc>'})
end

-- Main entry point - 'l' enters number mode
vim.keymap.set('n', 'l', enter_number_mode, { desc = 'Enter number navigation mode' })



-- Mac-style insert mode shortcuts
-- Basic clipboard operations
-- vim.keymap.set('i', '<D-c>', '<Esc>yyi', { desc = 'Copy line in insert mode' })
-- vim.keymap.set('i', '<D-x>', '<Esc>ddi', { desc = 'Cut line in insert mode' })


-- Line operations
-- vim.keymap.set('i', '<D-Return>', '<Esc>o', { desc = 'New line below' })
-- vim.keymap.set('i', '<D-S-Return>', '<Esc>O', { desc = 'New line above' })

-- Text selection in insert mode enter visual mode then return to insert)
-- vim.keymap.set('i', '<S-D-Left>', '<Esc>v^', { desc = 'Select to beginning o
-- vim.keymap.set('i', '<S-D-Right>', '<Esc>v$', { desc = 'Select to end of line' })
-- vim.keymap.set('i', '<M-S-Left>', '<Esc>vb', { desc = 'Select word backward' })
-- vim.keymap.set('i', '<M-S-Right>', '<Esc>vw', { desc = 'Select word forward' })
-- vim.keymap.set('i', '<S-Left>', '<Esc>vh', { desc = 'Select character left' })
-- vim.keymap.set('i', '<S-Right>', '<Esc>vl', { desc = 'Select character right' })
-- vim.keymap.set('i', '<S-Up>', '<Esc>vk', { desc = 'Select line up' })
-- vim.keymap.set('i', '<S-Down>', '<Esc>vj', { desc = 'Select line down' })

-- File operations
vim.keymap.set('i', '<D-s>', '<Esc>:w<CR>i', { desc = 'Save file in insert mode' })

vim.keymap.set('n', '<S-D-]>', ':tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<S-D-[>', ':tabprevious<CR>', { desc = 'Previous tab' })

require("config.lazy")
require("config.abbreviations").setup()


-- todo: tabs, search files and folders, better auto wrapping, organize file, better paste buffer and selection