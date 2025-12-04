local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Python
vim.lsp.enable("pyright")
vim.lsp.config("pyright", { capabilities = capabilities })

-- Lua
vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
        },
    },
})

-- GDScript
vim.lsp.enable("gdscript")
vim.lsp.config("gdscript", { capabilities = capabilities })

-- Rust
--vim.lsp.config("rust_analyzer", { settings = { ["rust-analyzer"] = {} } })
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("rust_analyzer")

vim.api.nvim_create_user_command("LspRename", function()
    vim.lsp.buf.rename()
end, { desc = "Rename with LSP" })
