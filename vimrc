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
" Languages
Plug 'chrisbra/csv.vim'
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'lervag/vimtex'
" Theme
Plug 'morhetz/gruvbox'
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
autocmd FileType yaml setlocal sw=2 ts=2

" == Plugins ==

" vimwiki
let g:vimwiki_list = [{'path': '~/.vimwiki/'}]

" map NERDTree to F2
map <F2> :NERDTreeTabsToggle<CR>

" map Tagbar to F8
nmap <F8> :TagbarToggle<CR>

" Auto RustFmt
let g:rustfmt_autosave = 1

" Disable GitGutter by default
let g:gitgutter_enabled = 0

" ALE
let g:ale_lint_on_insert_leave = 0
let g:ale_cpp_flawfinder_minlevel = 3
let g:ale_c_flawfinder_minlevel = 3
let g:ale_python_pylint_executable = 'pylint3'
let g:ale_fixers = {
\    '*': ['trim_whitespace'],
\    'go': ['gofmt', 'goimports'],
\}
let g:ale_fix_on_save = 1

" Accelerate Tagbar update
set updatetime=2000

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

set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
" No background color (terminal default color)
hi Normal ctermbg=NONE
hi Visual ctermfg=gray
hi ColorColumn ctermbg=gray
highlight LineNr ctermfg=Blue guifg=LightBlue
