return {
    -- Loaded eagerly: the statusline calls FugitiveStatusline()
    { "tpope/vim-fugitive" },
    {
        "airblade/vim-gitgutter",
        keys = {
            { "<leader>gp", ":GitGutterPreviewHunk<CR>", desc = "Preview git hunk" },
        },
        init = function()
            -- Disable GitGutter by default
            vim.g.gitgutter_enabled = 0
        end,
    },
}
