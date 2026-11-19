-- Godot settings for gdscript files (uses :GodotRun / :GodotRunCurrent
-- provided by a Godot plugin such as vim-godot)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "gdscript",
    callback = function()
        vim.bo.noexpandtab = true
        vim.keymap.set("n", "<F5>", ":GodotRun<CR>", { buffer = true })
        vim.keymap.set("n", "<F6>", ":GodotRunCurrent<CR>", { buffer = true })
    end,
})
