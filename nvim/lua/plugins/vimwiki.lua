return {
    "vimwiki/vimwiki",
    ft = { "vimwiki", "markdown" },
    init = function()
        vim.g.vimwiki_list = {
            { path = "~/.vimwiki/" },
            { path = "~/.vimworky/", syntax = "markdown", ext = ".md" },
        }
        -- Disable wiki syntax on markdown files
        vim.g.vimwiki_global_ext = 0
    end,
}
