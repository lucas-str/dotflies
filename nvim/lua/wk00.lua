-- Disable editorconfig
vim.g.editorconfig = false

-- Override the personal :Date command from utils/date.lua
vim.api.nvim_create_user_command("Date", function()
    vim.cmd('0read !LC_ALL=fr_FR.utf8 date "+\\%A \\%d \\%B \\%Y"')
    vim.cmd("normal vU")
end, { desc = "Insert date to current line" })

-- nvim-treesitter: groovy parser from a fork (fix-groovy_doc branch)
local ts_parsers = require("nvim-treesitter.parsers")
---@diagnostic disable-next-line: missing-fields
ts_parsers.groovy.install_info = {
    url = "https://github.com/lucas-str/tree-sitter-groovy",
    branch = "fix-groovy_doc",
}
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

-- Overrides for lazy-loaded plugins: apply them right after each plugin's own
-- setup() has run. lazy.nvim fires User LazyLoad with the plugin name in
-- ev.data; conform.setup() merges over formatters_by_ft, so mutating the
-- tables before that would be clobbered.
vim.api.nvim_create_autocmd("User", {
    pattern = "LazyLoad",
    callback = function(ev)
        if ev.data == "conform.nvim" then
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
        elseif ev.data == "nvim-lint" then
            -- Lint
            local lint = require("lint")
            lint.linters_by_ft.python = { "pylint", "mypy" }
            lint.linters_by_ft.groovy = { "npm-groovy-lint" }
            lint.linters["npm-groovy-lint"].args = { "--failon", "none", "--loglevel", "warning" }
        elseif ev.data == "nvim-lspconfig" then
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
        end
    end,
})
