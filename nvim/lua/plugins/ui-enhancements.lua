return {
    -- Better UI for LSP diagnostics, references, etc.
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
        keys = {
            { 
                "<leader>xx", 
                "<cmd>Trouble diagnostics toggle<cr>", 
                desc = "Diagnostics (Trouble)" 
            },
            { 
                "<leader>xX", 
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", 
                desc = "Buffer Diagnostics (Trouble)" 
            },
            { 
                "<leader>cs", 
                "<cmd>Trouble symbols toggle focus=false<cr>", 
                desc = "Symbols (Trouble)" 
            },
            { 
                "<leader>cl", 
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", 
                desc = "LSP Definitions / references / ... (Trouble)" 
            },
            { 
                "<leader>xL", 
                "<cmd>Trouble loclist toggle<cr>", 
                desc = "Location List (Trouble)" 
            },
            { 
                "<leader>xQ", 
                "<cmd>Trouble qflist toggle<cr>", 
                desc = "Quickfix List (Trouble)" 
            },
        },
        opts = {},
    },
    
    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
        },
        opts = {
            disable_netrw = true,
            hijack_netrw = true,
            view = {
                width = 30,
                side = "left",
            },
            renderer = {
                add_trailing = false,
                group_empty = false,
                highlight_git = false,
                full_name = false,
                highlight_opened_files = "none",
                root_folder_label = ":~:s?$?/..?",
                indent_width = 2,
                indent_markers = {
                    enable = false,
                    inline_arrows = true,
                    icons = {
                        corner = "└",
                        edge = "│",
                        item = "│",
                        none = " ",
                    },
                },
                icons = {
                    webdev_colors = true,
                    git_placement = "before",
                    padding = " ",
                    symlink_arrow = " ➛ ",
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                },
            },
        },
    },
    
    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'catppuccin',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
        },
    },
    
    -- Buffer line
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        version = "*",
        opts = {
            options = {
                mode = "buffers",
                separator_style = "slant",
                always_show_bufferline = false,
                show_buffer_close_icons = false,
                show_close_icon = false,
                color_icons = true,
            },
        },
    },
}