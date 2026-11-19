return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- required on Neovim 0.12+ (the old master branch is frozen)
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        local parsers = { "c", "gitcommit", "lua", "markdown", "markdown_inline", "python", "rust" }
        ts.install(parsers)

        -- Filetypes covered by the installed parsers
        local filetypes = {}
        for _, parser in ipairs(parsers) do
            for _, ft in ipairs(vim.treesitter.language.get_filetypes(parser)) do
                filetypes[#filetypes + 1] = ft
            end
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetypes,
            callback = function()
                -- syntax highlighting, provided by Neovim
                vim.treesitter.start()
                -- indentation, provided by nvim-treesitter
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
