vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "vimwiki" },
    command = "setlocal colorcolumn=80 textwidth=79",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "vimwiki",
    command = "setlocal formatoptions+=t",
})

-- Jump to last cursor line
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local prevline = vim.fn.line("'\"")
        local numlines = vim.fn.line("$")
        if prevline >= 1 and prevline <= numlines and vim.bo.ft ~= "commit" then
            vim.cmd('normal! g`"')
        end
    end,
})
