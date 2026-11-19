return {
    {
        "tpope/vim-surround",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "jiangmiao/auto-pairs",
        event = { "BufReadPre", "BufNewFile" },
        init = function()
            vim.g.AutoPairsCenterLine = 0
            -- auto-pairs' <CR> wrapper does maparg('<CR>', 'i', 0, 1)['rhs'],
            -- which throws E716 on Lua-callback mappings (in Nvim 0.12+ the
            -- dict has "callback" instead of "rhs") — e.g. in the snacks
            -- picker input buffer or wherever nvim-cmp maps <CR>. Disabling
            -- the <CR> remap avoids the crash; pair auto-closing still works.
            vim.g.AutoPairsMapCR = 0
        end,
        config = function()
            local rules = {
                c = { ["/*"] = "*/" },
                cpp = { ["/*"] = "*/" },
                rust = { ["\\w\\zs<"] = ">" },
                html = { ["<!--"] = "-->", ["{%"] = "%}" },
                htmldjango = { ["{"] = "}", ["{%"] = "%}" },
            }
            vim.api.nvim_create_autocmd("FileType", {
                pattern = vim.tbl_keys(rules),
                callback = function(args)
                    vim.b.AutoPairs = vim.fn["AutoPairsDefine"](rules[args.match])
                end,
            })
        end,
    },
}
