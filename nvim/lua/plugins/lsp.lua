return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Mason for easy LSP server management
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            
            -- Additional lua configuration for neovim
            "folke/neodev.nvim",
        },
        config = function()
            -- Setup neodev for better neovim lua development
            require("neodev").setup({})
            
            -- Setup mason
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",      -- Python
                    "marksman",     -- Markdown
                    "lua_ls",       -- Lua
                },
            })
            
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            
            -- LSP keymaps function
            local on_attach = function(client, bufnr)
                local opts = { 
                    buffer = bufnr, 
                    remap = false 
                }
                
                vim.keymap.set(
                    "n", 
                    "gd", 
                    vim.lsp.buf.definition, 
                    opts
                )
                vim.keymap.set(
                    "n", 
                    "gr", 
                    vim.lsp.buf.references, 
                    opts
                )
                vim.keymap.set(
                    "n", 
                    "K", 
                    vim.lsp.buf.hover, 
                    opts
                )
                vim.keymap.set(
                    "n", 
                    "<leader>vd", 
                    vim.diagnostic.open_float, 
                    opts
                )
                vim.keymap.set(
                    "n", 
                    "[d", 
                    vim.diagnostic.goto_next, 
                    opts
                )
                vim.keymap.set(
                    "n", 
                    "]d", 
                    vim.diagnostic.goto_prev, 
                    opts
                )
                vim.keymap.set(
                    "n", 
                    "<leader>vca", 
                    vim.lsp.buf.code_action, 
                    opts
                )
                vim.keymap.set(
                    "n", 
                    "<leader>vrn", 
                    vim.lsp.buf.rename, 
                    opts
                )
                vim.keymap.set(
                    "i", 
                    "<C-h>", 
                    vim.lsp.buf.signature_help, 
                    opts
                )
            end
            
            -- Python
            lspconfig.pyright.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            
            -- Markdown
            lspconfig.marksman.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
            
            -- Lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                        },
                    },
                },
            })

            -- Configure diagnostics
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = false,
                float = {
                    border = 'rounded',
                    source = 'always',
                    header = '',
                    prefix = '',
                },
            })
        end,
    },
}