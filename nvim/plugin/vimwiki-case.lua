-- Automatic case for vimwiki
vim.api.nvim_create_augroup("vimwiki-case", { clear = true })
vim.api.nvim_create_autocmd("InsertCharPre", {
    pattern = { "*.wiki" },
    group = "vimwiki-case",
    callback = function(opts)
        -- \v: use very magic pattern
        -- %^: start of file
        -- [.!?]\_s: punctuation mark followed by whitespace or eol
        -- \_^\s*\-\s+: sol, whitespace(s), dash, whitespace(s)
        -- \n\n: two new lines
        -- %#: cursor position
        local res = vim.fn.search("\\v(%^|[.!?]\\_s|\\_^\\s*\\-\\s+|\\n\\n)\\_s*%#", "bcnw")
        if res ~= 0 then
            vim.v.char = vim.fn.toupper(vim.v.char)
        end
    end,
})
