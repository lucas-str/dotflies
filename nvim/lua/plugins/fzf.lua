return {
    {
        "junegunn/fzf",
        -- Download the prebuilt fzf binary into the repo's bin/ directory,
        -- where fzf's own plugin/fzf.vim looks for it.
        build = "./install --bin",
    },
    {
        "junegunn/fzf.vim",
        dependencies = { "junegunn/fzf" },
        keys = {
            { "<leader>f", ":Files<CR>", desc = "Find files" },
            { "<leader>b", ":Buffers<CR>", desc = "List buffers" },
            { "<leader>t", ":Windows<CR>", desc = "List windows" },
        },
        init = function()
            vim.g.fzf_action = {
                enter = "drop",
                ["ctrl-t"] = "tab drop",
                ["ctrl-x"] = "split",
                ["ctrl-v"] = "vsplit",
            }
            if vim.fn.executable("rg") == 1 then
                vim.env.FZF_DEFAULT_COMMAND =
                    'rg --files --hidden --follow --glob "!{.git,tmpenv}/*" --glob "!tags" 2>/dev/null'
            end
            -- Use nvim window and not Zellij/Tmux popup.
            vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
        end,
    },
}
