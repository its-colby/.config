return {
    
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