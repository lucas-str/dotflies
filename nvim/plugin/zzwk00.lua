-- Disable editorconfig
vim.g.editorconfig = false

vim.api.nvim_create_user_command("Date", function()
    vim.cmd('0read !LC_ALL=fr_FR.utf8 date "+\\%A \\%d \\%B \\%Y"')
    vim.cmd("normal vU")
end, { desc = "Insert date to current line" })

-- nvim-treesitter
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.groovy = {
    install_info = {
        url = "~/Workspace/External/tree-sitter-groovy", -- local path or git repo
        files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "hotfix/disable-groovy-doc", -- default branch in case of git repo if different from master
        -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
        -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    },
    -- filetype = "groovy", -- if filetype does not match the parser name
}

-- Conform
local conform = require("conform")
conform.formatters_by_ft.python = { "isort", "black" }
conform.formatters.isort = { prepend_args = { "--profile", "black" } }
conform.formatters_by_ft.groovy = { "npm-groovy-lint" }
-- conform.formatters["npm-groovy-lint"] = { prepend_args = { "--failon", "none" } }
-- conform.formatters["npm-groovy-lint"] = {
--     inherit = false,
--     command = "npm-groovy-lint",
--     args = { "--failon", "none", "--fix", "-" },
-- }

-- Lint
local lint = require("lint")
lint.linters_by_ft.python = { "pylint", "mypy" }
lint.linters_by_ft.groovy = { "npm-groovy-lint" }
lint.linters["npm-groovy-lint"].args = { "--failon", "none", "--loglevel", "warning" }

-- ALE
-- fixers
-- local fixers = vim.g.ale_fixers or {}
-- fixers["html"] = { "prettier" }
-- fixers["json"] = { "prettier" }
-- fixers["yaml"] = { "prettier" }
-- vim.g.ale_fixers = fixers
-- Groovy
-- vim.g.ale_groovy_npmgroovylint_fix_options = "--format"
