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
            vim.g.mkdp_browser = "Arc"
            vim.g.mkdp_echo_preview_url = 1

            vim.keymap.set(
                "n",
                "<leader>mp",
                ":MarkdownPreviewToggle<CR>",
                { desc = "Toggle Markdown Preview" }
            )
        end,
    },
    -- In-buffer markdown rendering
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        ft = { "markdown" },
        cmd = { "RenderMarkdown" },
        opts = {
            enabled = true,
            file_types = { "markdown" },
            latex = { enabled = false },
            render_modes = { "n", "c", "t" },
            max_file_size = 10.0,
        },
        config = function()
            vim.keymap.set(
                "n",
                "<leader>mr",
                ":RenderMarkdown toggle<CR>",
                { desc = "Render Markdown in editor" }
            )
        end,
    },
}