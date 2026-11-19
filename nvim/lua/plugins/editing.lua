return {
    {
        "tpope/vim-surround",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "jiangmiao/auto-pairs",
        event = { "BufReadPre", "BufNewFile" },
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
            vim.g.AutoPairsCenterLine = 0
        end,
    },
}
