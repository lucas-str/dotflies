local plugpath = vim.fn.stdpath("data") .. "/site/autoload/plug.vim"
local pluginstall = false
if not vim.uv.fs_stat(plugpath) then
    local plugurl = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    local out = vim.fn.system({ "curl", "-fLo", plugpath, "--create-dirs", plugurl })
    if vim.v.shell_error ~= 0 then
        error("Error getting plug.nvim:\n" .. out)
    end
    vim.opt.rtp:prepend(plugpath)
    pluginstall = true
end

local Plug = vim.fn["plug#"]
vim.call("plug#begin")
-- LSP
Plug("neovim/nvim-lspconfig")
-- Snippets
Plug("L3MON4D3/LuaSnip", { tag = "v2.*", ["do"] = "make install_jsregexp" })
-- Completion
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("saadparwaiz1/cmp_luasnip")
-- Lint
Plug("mfussenegger/nvim-lint")
-- Format
Plug("stevearc/conform.nvim")
-- Highlight
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
-- Other
Plug("airblade/vim-gitgutter")
Plug("jiangmiao/auto-pairs")
Plug("junegunn/fzf", {
    ["do"] = function()
        vim.fn["fzf#install"]()
    end,
})
Plug("junegunn/fzf.vim")
Plug("tpope/vim-fugitive")
Plug("tpope/vim-surround")
Plug("vimwiki/vimwiki")
-- Theme
Plug("sainnhe/gruvbox-material")
vim.call("plug#end")

if pluginstall then
    vim.cmd("PlugInstall --sync")
end

if vim.fn.has("termguicolors") then
    vim.opt.termguicolors = true
end
vim.opt.background = "dark"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_better_performance = 1
vim.cmd("silent! colorscheme gruvbox-material")

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

-- set timeout timeoutlen=1000 ttimeoutlen=10
-- vim.opt.timeoutlen = 250

-- Zsh command completion style
vim.opt.wildmode = "longest,list,full"

vim.opt.splitright = true

vim.opt.updatetime = 2000

-- Navigate properly when lines are wrapped
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "vimwiki" },
    command = "setlocal colorcolumn=80 textwidth=79",
})

-- Jump to last cursor line
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local prevline = vim.fn.line("'\"")
        local numlines = vim.fn.line("$")
        if prevline >= 1 and prevline <= numlines and vim.bo.ft ~= "commit" then
            vim.cmd('normal! g`"')
        end
    end,
})
