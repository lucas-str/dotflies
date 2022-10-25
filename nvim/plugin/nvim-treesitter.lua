require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "python", "rust"},
    auto_install = true,
    highlight = {
        enable = true,
    }
}
