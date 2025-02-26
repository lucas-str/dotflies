local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
        lua = { "stylua" },
        ["*"] = { "trim_whitespace" },
    },
    format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.format_disable or vim.b[bufnr].format_disable then
            return
        end
        return { timeout_ms = 2000, lsp_format = "fallback" }
    end,
})

conform.formatters.stylua = { prepend_args = { "--indent-type", "Spaces" } }

vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        vim.b.format_disable = true
    else
        vim.g.format_disable = true
    end
end, { desc = "Disable autoformat-on-save", bang = true })
vim.api.nvim_create_user_command("FormatEnable", function(args)
    if args.bang then
        vim.b.format_disable = false
    else
        vim.g.format_disable = false
    end
end, { desc = "Enable autoformat-on-save", bang = true })

vim.api.nvim_create_user_command("Format", function(args)
    conform.format({ async = true })
end, { desc = "Format" })
