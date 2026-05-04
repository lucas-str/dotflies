-- Disable editorconfig
vim.g.editorconfig = false

vim.api.nvim_create_user_command("Date", function()
    vim.cmd('0read !LC_ALL=fr_FR.utf8 date "+\\%A \\%d \\%B \\%Y"')
    vim.cmd("normal vU")
end, { desc = "Insert date to current line" })

-- nvim-treesitter
-- Old configuration (master branch):
--local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
--parser_config.groovy = {
--    install_info = {
--        url = "~/Workspace/External/tree-sitter-groovy", -- local path or git repo
--        files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
--        -- optional entries:
--        branch = "hotfix/disable-groovy-doc", -- default branch in case of git repo if different from master
--        -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
--        -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
--    },
--    -- filetype = "groovy", -- if filetype does not match the parser name
--}
-- New configuration (main branch):
--vim.api.nvim_create_autocmd("FileType", {
--    pattern = { "groovy" },
--    callback = function()
--        -- syntax highlighting, provided by Neovim
--        vim.treesitter.start()
--        -- indentation, provided by nvim-treesitter
--        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--    end,
--})
-- Use local repo: edit `grammar.js` and run `tree-sitter generate`
vim.api.nvim_create_autocmd("User", {
    pattern = "TSUpdate",
    callback = function()
        require("nvim-treesitter.parsers").groovy = {
            install_info = {
                path = "~/Workspace/External/tree-sitter-groovy",
            },
        }
    end,
})
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
conform.formatters_by_ft.kotlin = { "ktlint" }

-- Lint
local lint = require("lint")
lint.linters_by_ft.python = { "pylint", "mypy" }
lint.linters_by_ft.groovy = { "npm-groovy-lint" }
lint.linters["npm-groovy-lint"].args =
    { "--failon", "none", "--loglevel", "warning", "-c", "recommended", "-o", "json", "-" }
lint.linters_by_ft.kotlin = { "ktlint" }

-- lspconfig
-- https://github.com/GroovyLanguageServer/groovy-language-server
vim.lsp.enable("groovyls")
vim.lsp.config("groovyls", {
    cmd = {
        "java",
        "-jar",
        "/home/lsturelle/Workspace/External/groovy-language-server/build/libs/groovy-language-server-all.jar",
    },
})

-- ALE
-- fixers
-- local fixers = vim.g.ale_fixers or {}
-- fixers["html"] = { "prettier" }
-- fixers["json"] = { "prettier" }
-- fixers["yaml"] = { "prettier" }
-- vim.g.ale_fixers = fixers
-- Groovy
-- vim.g.ale_groovy_npmgroovylint_fix_options = "--format"
