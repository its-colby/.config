return {
    -- YAML-specific configuration
    {
        "cuducos/yaml.nvim",
        ft = "yaml",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            -- Set YAML-specific indentation to match global settings
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {"yaml", "yml"},
                callback = function()
                    -- Set YAML-specific indentation to match global settings
                    vim.opt_local.tabstop = 4
                    vim.opt_local.shiftwidth = 4
                    vim.opt_local.softtabstop = 4
                    vim.opt_local.expandtab = true
                    vim.opt_local.autoindent = true
                    vim.opt_local.smartindent = false  -- Disable smart indent for YAML
                    
                    -- Preserve global text wrapping settings for YAML files
                    vim.opt_local.textwidth = 80
                    vim.opt_local.wrap = true
                    vim.opt_local.linebreak = true
                    vim.opt_local.formatoptions:append("t")  -- Enable auto-wrap text using textwidth
                end,
            })
        end,
    },
}
