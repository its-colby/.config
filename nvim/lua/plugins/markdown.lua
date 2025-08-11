return {
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
    
    -- Enhanced markdown rendering in Neovim
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { 
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons" -- Optional: for icons
        },
        ft = { "markdown" },
        opts = {
            -- Enable the plugin
            enabled = true,
            -- File types this plugin will run on
            file_types = { "markdown" },
            -- Render modes that will show the rendered view
            render_modes = { "n", "c", "t" },
            -- Maximum file size (in MB) that this plugin will attempt to render
            max_file_size = 10.0,
            -- Heading configuration
            heading = {
                enabled = true,
                sign = true,
                position = "overlay",
                icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
                signs = { "󰫎 " },
                width = "full",
                backgrounds = {
                    "RenderMarkdownH1Bg",
                    "RenderMarkdownH2Bg", 
                    "RenderMarkdownH3Bg",
                    "RenderMarkdownH4Bg",
                    "RenderMarkdownH5Bg",
                    "RenderMarkdownH6Bg",
                },
                foregrounds = {
                    "RenderMarkdownH1",
                    "RenderMarkdownH2",
                    "RenderMarkdownH3", 
                    "RenderMarkdownH4",
                    "RenderMarkdownH5",
                    "RenderMarkdownH6",
                },
            },
            -- Code block configuration
            code = {
                enabled = true,
                sign = true,
                style = "full",
                position = "left",
                language_icon = true,
                language_name = true,
                width = "full",
                highlight = "RenderMarkdownCode",
            },
            -- Dash/horizontal rule configuration
            dash = {
                enabled = true,
                icon = "─",
                width = "full",
            },
            -- List bullet configuration
            bullet = {
                enabled = true,
                icons = { "●", "○", "◆", "◇" },
            },
            -- Checkbox configuration
            checkbox = {
                enabled = true,
                unchecked = { icon = "󰄱 " },
                checked = { icon = "󰱒 " },
            },
            -- Quote block configuration
            quote = {
                enabled = true,
                icon = "▋",
            },
        },
        config = function(_, opts)
            require("render-markdown").setup(opts)
            
            -- Add keymaps for render-markdown
            vim.keymap.set(
                "n", 
                "<leader>mr", 
                ":RenderMarkdown toggle<CR>", 
                { desc = "Toggle Markdown Rendering" }
            )
        end,
    },
}