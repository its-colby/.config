return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- Completion sources
            "hrsh7th/cmp-nvim-lsp",     -- LSP completion
            "hrsh7th/cmp-buffer",       -- Buffer completion
            "hrsh7th/cmp-path",         -- Path completion
            "hrsh7th/cmp-cmdline",      -- Command line completion
            
            -- Snippet engine (required by nvim-cmp)
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets", -- Predefined snippets
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            
            -- Load friendly snippets
            require("luasnip.loaders.from_vscode").lazy_load()
            
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    -- Use Tab to cycle through completions
                    ["<Tab>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            else
                                fallback()
                            end
                        end, 
                        { "i", "s" }
                    ),
                    -- Use Cmd+Shift+Option+M to accept completion
                    ["<D-S-M-m>"] = cmp.mapping.confirm({ select = true }),
                    ["<D-S-M-S-m>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end, 
                        { "i", "s" }
                    ),
                    -- Explicitly disable arrow keys and enter for completion navigation
                    ["<Up>"] = cmp.mapping(function(fallback) fallback() end, { "i" }),
                    ["<Down>"] = cmp.mapping(function(fallback) fallback() end, { "i" }),
                    ["<CR>"] = cmp.mapping(function(fallback) fallback() end, { "i" }),
                },
                sources = cmp.config.sources(
                    {
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                    }, 
                    {
                        { name = "buffer" },
                        { name = "path" },
                    }
                ),
                formatting = {
                    format = function(entry, vim_item)
                        -- Add source name to completion items
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
            })
            
            -- Command line completion
            cmp.setup.cmdline(
                { '/', '?' }, 
                {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = {{ name = 'buffer' }}
                }
            )
            
            cmp.setup.cmdline(
                ':', 
                {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources(
                        {{ name = 'path' }}, 
                        {{ name = 'cmdline' }}
                    )
                }
            )
        end,
    },
}