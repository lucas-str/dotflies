local lint = require("lint")

lint.linters_by_ft = {
    python = { "ruff", "mypy" },
    rust = { "clippy" },
}

lint.linters.mypy.args = { "--ignore-missing-imports" }

vim.api.nvim_create_autocmd({ "CursorHold" }, {
    callback = function()
        if vim.g.lint_disable or vim.b.lint_disable then
            return
        end
        lint.try_lint()
    end,
})

vim.api.nvim_create_user_command("LintDisable", function(args)
    if args.bang then
        vim.b.lint_disable = true
    else
        vim.g.lint_disable = true
    end
end, { desc = "Disable lint", bang = true })
vim.api.nvim_create_user_command("LintEnable", function(args)
    if args.bang then
        vim.b.lint_disable = false
    else
        vim.g.lint_disable = false
    end
end, { desc = "Enable lint", bang = true })

vim.api.nvim_create_user_command("Lint", function(args)
    lint.try_lint()
end, { desc = "Lint" })
