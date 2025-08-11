return {
    {
        "nvim-treesitter/nvim-treesitter", 
        branch = 'master', 
        lazy = false, 
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { 
                    "lua", "vim", "vimdoc", 
                    "python",
                    "javascript","typescript", "html", "css", 
                    "json", "toml", "yaml",
                    "markdown", "markdown_inline", 
                    "rust", "cpp", "c",
                    "agda",
                    "ocaml", "haskell",
                    "bash",
                },
                
                sync_install = false,
                auto_install = true,
                
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                
                indent = {
                    enable = true,
                    disable = { "yaml" },
                },
            })
        end,
    },
}
