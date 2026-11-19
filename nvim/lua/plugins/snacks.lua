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
    -- stylua: ignore
    keys = {
        { "<leader>f:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>fD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
        { "<leader>fb", function() Snacks.picker.buffers({ current = false }) end, desc = "Buffers" },
        { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>fl", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    },
}
