-- Disable editorconfig
vim.g.editorconfig = false

vim.api.nvim_create_user_command("Date", function()
    vim.cmd('0read !LC_ALL=fr_FR.utf8 date "+\\%A \\%d \\%B \\%Y"')
    vim.cmd("normal vU")
end, { desc = "Insert date to current line" })

-- nvim-treesitter
vim.api.nvim_create_autocmd("User", {
    pattern = "TSUpdate",
    callback = function()
        ---@diagnostic disable: missing-fields
        require("nvim-treesitter.parsers").groovy.install_info = {
            url = "https://github.com/lucas-str/tree-sitter-groovy",
            branch = "fix-groovy_doc",
        }
        ---@diagnostic enable: missing-fields
    end,
})
require("nvim-treesitter").install({ "groovy" })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "groovy" },
    callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

-- Conform
local conform = require("conform")
conform.formatters_by_ft.python = { "isort", "black" }
conform.formatters.isort = { prepend_args = { "--profile", "black" } }
conform.formatters_by_ft.groovy = { "npm-groovy-lint" }
-- `npm install -g npm-groovy-lint`
conform.formatters["npm-groovy-lint"] = {
    command = "npm-groovy-lint",
    -- args = { "--failon", "none", "--fix", "-" },
    args = { "--failon", "none", "--format", "$FILENAME" },
    stdin = false,
}

-- Lint
local lint = require("lint")
lint.linters_by_ft.python = { "pylint", "mypy" }
lint.linters_by_ft.groovy = { "npm-groovy-lint" }
lint.linters["npm-groovy-lint"].args = { "--failon", "none", "--loglevel", "warning" }

-- lspconfig
-- https://github.com/GroovyLanguageServer/groovy-language-server
vim.lsp.enable("groovyls")
--vim.lsp.config("groovyls", {
--    cmd = {
--        "java",
--        "-jar",
--        "/home/lsturelle/Workspace/External/groovy-language-server/build/libs/groovy-language-server-all.jar",
--    },
--})
--vim.lsp.enable("kotlin_lsp")

-- ALE
-- fixers
-- local fixers = vim.g.ale_fixers or {}
-- fixers["html"] = { "prettier" }
-- fixers["json"] = { "prettier" }
-- fixers["yaml"] = { "prettier" }
-- vim.g.ale_fixers = fixers
-- Groovy
-- vim.g.ale_groovy_npmgroovylint_fix_options = "--format"
