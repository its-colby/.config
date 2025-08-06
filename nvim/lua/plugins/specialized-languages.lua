return {
    -- Agda support
    {
        "isovector/agda-vim",
        ft = { "agda" },
        config = function()
            -- Agda keymaps (these will work when agda-mode is installed)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "agda",
                callback = function()
                    local opts = {
                        buffer = true,
                        noremap = true
                    }
                    -- Common Agda commands
                    vim.keymap.set(
                        "n",
                        "<leader>al",
                        ":call agda#load()<CR>",
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>ar",
                        ":call agda#reload()<CR>",
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>ag",
                        ":call agda#give()<CR>",
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>as",
                        ":call agda#solve()<CR>",
                        opts
                    )
                end,
            })
        end,
    },
    
    -- Lean 4 support
    {
        "Julian/lean.nvim",
        event = {
            "BufReadPre *.lean",
            "BufNewFile *.lean"
        },
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim",
        },
        opts = {
            lsp = {
                on_attach = function(client, bufnr)
                    -- Lean-specific keymaps
                    local opts = {
                        buffer = bufnr,
                        remap = false
                    }
                    vim.keymap.set(
                        "n",
                        "<leader>li",
                        function()
                            require("lean").infoview_toggle()
                        end,
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>lp",
                        function()
                            require("lean").infoview_pause()
                        end,
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>lr",
                        function()
                            require("lean").restart()
                        end,
                        opts
                    )
                end,
            },
            mappings = true,
        },
    },
    
    -- Enhanced Markdown support
    {
        "plasticboy/vim-markdown",
        ft = "markdown",
        dependencies = { "godlygeek/tabular" },
        config = function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_conceal = 2
            vim.g.vim_markdown_conceal_code_blocks = 0
            vim.g.vim_markdown_math = 1
            vim.g.vim_markdown_frontmatter = 1
            vim.g.vim_markdown_strikethrough = 1
            vim.g.vim_markdown_new_list_item_indent = 2
        end,
    },
    
    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { 
            "MarkdownPreviewToggle", 
            "MarkdownPreview", 
            "MarkdownPreviewStop" 
        },
        ft = { "markdown" },
        build = "cd app && npm install",
        config = function()
            vim.keymap.set(
                "n",
                "<leader>mp",
                ":MarkdownPreviewToggle<CR>",
                { desc = "Toggle Markdown Preview" }
            )
        end,
    },
    
    -- Additional Haskell support
    {
        "neovimhaskell/haskell-vim",
        ft = "haskell",
        config = function()
            vim.g.haskell_enable_quantification = 1
            vim.g.haskell_enable_recursivedo = 1
            vim.g.haskell_enable_arrowsyntax = 1
            vim.g.haskell_enable_pattern_synonyms = 1
            vim.g.haskell_enable_typeroles = 1
            vim.g.haskell_enable_static_pointers = 1
            vim.g.haskell_backpack = 1
        end,
    },
    
    -- Python enhancements
    {
        "Vimjas/vim-python-pep8-indent",
        ft = "python",
    },
    
    -- General programming enhancements
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    
    {
        "numToStr/Comment.nvim",
        lazy = false,
        opts = {},
    },
}