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
                    vim.opt_local.tabstop = 4
                    vim.opt_local.shiftwidth = 4
                    vim.opt_local.softtabstop = 4
                    vim.opt_local.expandtab = true
                    vim.opt_local.autoindent = true
                    vim.opt_local.smartindent = false  -- Disable smart indent for YAML
                end,
            })
        end,
    },
}
