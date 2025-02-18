local plugpath = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if not vim.uv.fs_stat(plugpath) then
    local plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    local out = vim.fn.system({'curl', '-fLo', plugpath, '--create-dirs', plugurl})
    if vim.v.shell_error ~= 0 then
        error('Error getting plug.nvim:\n' .. out)
    end
    vim.opt.rtp:prepend(plugpath)
end

local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('airblade/vim-gitgutter')
Plug('dense-analysis/ale')
Plug('jiangmiao/auto-pairs')
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug('junegunn/fzf.vim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('sainnhe/gruvbox-material')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-surround')
Plug('vimwiki/vimwiki')
-- Language specific
Plug('rust-lang/rust.vim')
Plug 'habamax/vim-godot'
vim.call('plug#end')

if vim.fn.has('termguicolors') then
    vim.opt.termguicolors = true
end
vim.opt.background = 'dark'
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_better_performance = 1
vim.cmd('silent! colorscheme gruvbox-material')

vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.mouse = 'a'

vim.opt.statusline = [[%<%f %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%) %P]]

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.scrolloff = 4

vim.opt.clipboard = 'unnamed'

-- set timeout timeoutlen=1000 ttimeoutlen=10
-- vim.opt.timeoutlen = 250

-- Zsh command completion style
vim.opt.wildmode = 'longest,list,full'

vim.opt.splitright = true

-- Navigate properly when lines are wrapped
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'markdown', 'vimwiki'},
    command = 'setlocal colorcolumn=80 textwidth=79',
})

-- Jump to last cursor line
vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = '*',
    callback = function()
        local prevline = vim.fn.line('\'"')
        local numlines = vim.fn.line('$')
        if prevline >= 1 and prevline <= numlines and vim.bo.ft ~= 'commit' then
            vim.cmd('normal! g`"')
        end
    end,
})
