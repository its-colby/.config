return {
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
                    local opts = {buffer = bufnr, remap = false}
                    vim.keymap.set("n", "<localleader>f", function()
                            require("lean").infoview_toggle()
                        end, opts)
                    vim.keymap.set("n", "<localleader>d",function()
                            require("lean").infoview_pause()
                        end, opts)
                    vim.keymap.set("n", "<localleader>r", function()
                            require("lean").restart()
                        end, opts)
                end,
            },
            mappings = true,
        },
    },
}