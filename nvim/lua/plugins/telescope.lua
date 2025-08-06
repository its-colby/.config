return {
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        dependencies = { 
            'nvim-lua/plenary.nvim',
            -- Optional: for better sorting performance
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            local telescope = require('telescope')
            
            telescope.setup({
                defaults = {
                    -- Default configuration for telescope goes here:
                    mappings = {
                        i = {
                            -- Insert mode mappings
                            ["<Left>"] = "move_selection_previous",
                            ["<Right>"] = "move_selection_next",
                        },
                    },
                },
                pickers = {
                    -- Default configuration for builtin pickers goes here:
                    find_files = {
                        hidden = true,  -- Show hidden files
                    },
                },
                extensions = {
                    -- Your extension configuration goes here:
                }
            })
            
            -- Load extensions
            telescope.load_extension('fzf')
            
            -- Keymaps
            local builtin = require('telescope.builtin')
            vim.keymap.set(
                'n', 
                '<leader>ff', 
                builtin.find_files, 
                { desc = 'Find files' }
            )
            vim.keymap.set(
                'n', 
                '<leader>fg', 
                builtin.live_grep, 
                { desc = 'Live grep' }
            )
            vim.keymap.set(
                'n', 
                '<leader>fb', 
                builtin.buffers, 
                { desc = 'Find buffers' }
            )
            vim.keymap.set(
                'n', 
                '<leader>fh', 
                builtin.help_tags, 
                { desc = 'Find help' }
            )
            vim.keymap.set(
                'n', 
                '<leader>fr', 
                builtin.oldfiles, 
                { desc = 'Recent files' }
            )
            vim.keymap.set(
                'n', 
                '<leader>fc', 
                builtin.commands, 
                { desc = 'Find commands' }
            )
        end,
    },
}