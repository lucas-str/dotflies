local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Python
lspconfig.pyright.setup({ capabilities = capabilities })

-- Lua
lspconfig.lua_ls.setup({
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
lspconfig.gdscript.setup({ capabilities = capabilities })

-- Rust
lspconfig.rust_analyzer.setup({ settings = { ["rust-analyzer"] = {} } })

vim.api.nvim_create_user_command("LspRename", function()
    vim.lsp.buf.rename()
end, { desc = "Rename with LSP" })
