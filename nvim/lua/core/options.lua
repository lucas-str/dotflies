if vim.fn.has("termguicolors") then
    vim.opt.termguicolors = true
end
vim.opt.background = "dark"

vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.mouse = "a"

vim.opt.statusline = [[%<%f %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%) %P]]

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.scrolloff = 4

vim.opt.clipboard = "unnamed"

-- Zsh command completion style
vim.opt.wildmode = "longest,list,full"

vim.opt.splitright = true

vim.opt.updatetime = 2000
