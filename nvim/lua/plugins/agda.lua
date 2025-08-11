-- Set up Agda keymaps immediately for any .agda file
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.agda", "*.lagda", "*.lagda.*"},
    callback = function()
        print("Setting up Agda keymaps...")
        
        -- Core cornelis commands
        vim.keymap.set("n", "<localleader>f", ":CornelisLoad<CR>", 
            { buffer = true, desc = "Load Agda file" })
        vim.keymap.set("n", "<localleader>d", ":CornelisCloseInfoWindows<CR>",
            { buffer = true, desc = "Close info windows" })
        vim.keymap.set("n", "<localleader>uk", ":CornelisRefine<CR>", { buffer = true, desc = "Refine goal" })
        vim.keymap.set("n", "<localleader>ul", ":CornelisMakeCase<CR>", { buffer = true, desc = "Make case split" })
        vim.keymap.set("n", "<localleader>u;", ":CornelisTypeContext<CR>", { buffer = true, desc = "Show type context" })
        vim.keymap.set("n", "<localleader>a.", ":CornelisTypeContextInfer<CR>", { buffer = true, desc = "Show type context (infer)" })
        vim.keymap.set("n", "<localleader>an", ":CornelisSolve<CR>", { buffer = true, desc = "Solve goal" })
        vim.keymap.set("n", "<localleader>aa", ":CornelisAuto<CR>", { buffer = true, desc = "Auto solve" })
        vim.keymap.set("n", "<localleader>gd", ":CornelisGoToDefinition<CR>", { buffer = true, desc = "Go to definition" })
        
        -- Goal navigation
        vim.keymap.set("n", "<localleader>[/", ":CornelisPrevGoal<CR>", { buffer = true, desc = "Previous goal" })
        vim.keymap.set("n", "<localleader>]/", ":CornelisNextGoal<CR>", { buffer = true, desc = "Next goal" })
        
        -- Increment/decrement
        vim.keymap.set("n", "<C-a>", ":CornelisInc<CR>", { buffer = true, desc = "Increment" })
        vim.keymap.set("n", "<C-x>", ":CornelisDec<CR>", { buffer = true, desc = "Decrement" })
        
        print("Agda keymaps set!")
    end,
})

return {
    -- Agda support with Cornelis
    {
        "isovector/cornelis",
        name = "cornelis",
        ft = "agda",
        build = "stack install",
        dependencies = {
            "neovimhaskell/nvim-hs.vim",
            "kana/vim-textobj-user"
        },
        version = "*",
        config = function()
            -- Configure cornelis behavior
            vim.g.cornelis_max_size = 30
            vim.g.cornelis_max_width = 40
            vim.g.cornelis_split_location = "horizontal"
            vim.g.cornelis_rewrite_mode = "HeadNormal"
        end,
    },
}