runtime! debian.vim

" == Vim Plug ==

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/bundle')
" Misc
Plug 'ajh17/VimCompletesMe'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
" Dev
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
" Languages
Plug 'chrisbra/csv.vim'
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/indentpython.vim'
"Plug 'vim-python/python-syntax'
Plug 'lervag/vimtex'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'mfukar/robotframework-vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
" Theme
"Plug 'morhetz/gruvbox'
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

" Always allow the use of backspace in insert mode
set backspace=indent,eol,start

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Toggle number
set relativenumber number
nnoremap <Leader>n :set nonumber!<CR>
nnoremap <Leader>r :set relativenumber!<CR>

" Indent with 4 spaces
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set scrolloff=4

" Use system clipboard
set clipboard=unnamed

" Toggle highlight search
noremap <Leader>h :set hlsearch!<CR>

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
autocmd FileType {python,rust} setlocal textwidth=99 colorcolumn=100
autocmd FileType {c,cpp} setlocal colorcolumn=80
autocmd FileType {yaml,javascript,css,json} setlocal sw=2 ts=2

" Split to the right
set splitright

" Move tabs
noremap <C-S-PageUp> :-tabmove<CR>
noremap <C-S-PageDown> :+tabmove<CR>

" Accelerate Tagbar update
set updatetime=2000

" == Plugins ==

" Disable vim-markdown folding
let g:vim_markdown_folding_disabled = 1

" == Fix Autoclose ==
" Set timeoutlen to a lower value in insert mode so that pressing ESC
" instantly gets in normal mode.
" Since vim-autoclose maps ESC in insert mode, it would take 1s to go back to
" normal mode without this.
":autocmd InsertEnter * set timeoutlen=10
":autocmd InsertLeave * set timeoutlen=1000

" Suppress easytags ctags warning (tmp fix)
"let g:easytags_suppress_ctags_warning = 1
" Easytags asynchronous mode
"let g:easytags_async = 1

" == Theme and colors ==

"set background=dark
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox
"" No background color (terminal default color)
"hi Normal ctermbg=NONE
"hi Visual ctermfg=gray
"hi ColorColumn ctermbg=gray
""highlight LineNr ctermfg=Blue guifg=LightBlue

if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
