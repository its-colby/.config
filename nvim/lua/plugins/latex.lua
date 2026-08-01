return {
    {
        "lervag/vimtex",
        ft = { "tex", "plaintex", "bib" },
        init = function()
            -- Use latexmk for continuous compilation and open with Skim on macOS.
            vim.g.vimtex_view_method = "skim"
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_quickfix_mode = 0
            vim.g.tex_flavor = "latex"
        end,
        config = function()
            vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { desc = "LaTeX compile" })
            vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "LaTeX view PDF" })
            vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<CR>", { desc = "LaTeX stop compiler" })
            vim.keymap.set("n", "<leader>le", "<cmd>VimtexErrors<CR>", { desc = "LaTeX errors" })
            vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTocOpen<CR>", { desc = "LaTeX TOC" })
        end,
    },
}
