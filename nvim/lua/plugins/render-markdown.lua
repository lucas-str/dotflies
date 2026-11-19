return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "markdown" },
    opts = {
        heading = {
            sign = false,
        },
        code = {
            conceal_delimiters = false,
            border = "thin",
            inline = true,
            inline_left = "`",
            inline_right = "`",
        },
    },
}
