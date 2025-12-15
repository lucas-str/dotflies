require("nvim-treesitter").install({ "c", "python", "rust" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "python", "rust" },
    callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
