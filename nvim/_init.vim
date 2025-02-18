runtime! debian.vim

" == Vim Plug ==

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Misc
"Plug 'ajh17/VimCompletesMe'
"Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
"Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
" Dev
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" Languages
Plug 'chrisbra/csv.vim'
Plug 'rust-lang/rust.vim'
"Plug 'vim-scripts/indentpython.vim'
"Plug 'lervag/vimtex'
"Plug 'pangloss/vim-javascript'
"Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Glench/Vim-Jinja2-Syntax'
"Plug 'mfukar/robotframework-vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'habamax/vim-godot'
" Theme
Plug 'sainnhe/gruvbox-material'
call plug#end()

" == Misc ==

set nocompatible

if has("syntax")
  syntax on
endif

if has("autocmd")
  filetype plugin indent on
endif

set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set ignorecase  " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
set mouse=a     " Enable mouse usage (all modes)

" Cursor position in status bar
set ruler
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

" Always allow the use of backspace in insert mode
set backspace=indent,eol,start

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Relative line number
set relativenumber number

" Indent with 4 spaces
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set scrolloff=4

" Use system clipboard
set clipboard=unnamed

" Navigate properly when lines are wrapped
noremap j gj
noremap k gk

" Remove delay when exiting visual mode
set timeout timeoutlen=1000 ttimeoutlen=10

" Zsh command completion style
set wildmode=longest,list,full
set wildmenu

" Jump to last position
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
endif

" Per file type preferences
autocmd FileType {python,rust} setlocal colorcolumn=100
autocmd FileType {c,cpp} setlocal colorcolumn=80
autocmd FileType {yaml,javascript,css,json,html} setlocal sw=2 ts=2
autocmd FileType {markdown,vimwiki} setlocal colorcolumn=80 textwidth=79

" Split to the right
set splitright

" Move tabs
noremap <C-S-PageUp> :-tabmove<CR>
noremap <C-S-PageDown> :+tabmove<CR>

" Accelerate Tagbar update
set updatetime=2000

" == Theme and colors ==

if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
