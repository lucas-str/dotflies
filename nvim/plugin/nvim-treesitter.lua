local filetypes = {
    "c",
    "gitcommit",
    "lua",
    "python",
    "rust",
}

require("nvim-treesitter").install(filetypes)

vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
