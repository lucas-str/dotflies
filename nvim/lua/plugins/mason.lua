return {
    "mason-org/mason.nvim",
    -- Loaded before the first buffer so that mason/bin is on $PATH when the
    -- LSP servers (vim.lsp.enable) start on FileType.
    event = { "BufReadPre", "BufNewFile" },
    config = true, -- require("mason").setup()
}
