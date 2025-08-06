return {
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        dependencies = { 
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            local telescope = require('telescope')
            
            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<Left>"] = "move_selection_previous",
                            ["<Right>"] = "move_selection_next",
                        },
                    },
                },
                pickers = {
                    find_files = { hidden = true },
                },
            })
            
            telescope.load_extension('fzf')
            
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, 
                { desc = 'Find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, 
                { desc = 'Live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, 
                { desc = 'Find buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, 
                { desc = 'Find help' })
            vim.keymap.set('n', '<leader>fr', builtin.oldfiles, 
                { desc = 'Recent files' })
            vim.keymap.set('n', '<leader>fc', builtin.commands, 
                { desc = 'Find commands' })
        end,
    },
}