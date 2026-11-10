require("render-markdown").setup({
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
})
