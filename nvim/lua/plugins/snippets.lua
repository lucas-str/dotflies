return {
    {
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        build = "make install_jsregexp",
        config = function()
            -- Configure friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip").filetype_extend("groovy", { "javadoc" })
        end,
    },
    "rafamadriz/friendly-snippets",
}
