return {
    "sainnhe/gruvbox-material",
    lazy = false, -- load immediately so the colorscheme is available at startup
    priority = 1000,
    init = function()
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_better_performance = 1
    end,
    config = function()
        vim.cmd.colorscheme("gruvbox-material")
    end,
}
