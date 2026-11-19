return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        input = { enabled = true }, -- used by opencode.nvim
        picker = {
            enabled = true,
            sources = {
                -- mimic the old fzf rg command:
                -- rg --files --hidden --follow --glob "!{.git,tmpenv}/*" --glob "!tags"
                files = {
                    hidden = true,
                    follow = true,
                    exclude = { ".git/**", "tmpenv/**", "tags" },
                },
            },
            win = {
                input = {
                    keys = {
                        -- keep the old fzf mapping: ctrl-x opens in a split
                        -- (ctrl-t = tab and ctrl-v = vsplit are already defaults)
                        ["<c-x>"] = { "edit_split", mode = { "i", "n" } },
                    },
                },
            },
        },
    },
    keys = {
        {
            "<leader>f",
            function()
                Snacks.picker.files()
            end,
            desc = "Find files",
        },
        {
            "<leader>b",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>/",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
    },
}
