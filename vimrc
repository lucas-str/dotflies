runtime! debian.vim

" == Vim Plug ==

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/bundle')
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ajh17/VimCompletesMe'
Plug 'vimwiki/vimwiki'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'junegunn/goyo.vim'
"Plug 'morhetz/gruvbox'
call plug#end()

" == Theme and colors ==

"set background=dark
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox
" No background color (terminal default color)
":highlight Normal ctermbg=NONE
":highlight Visual ctermfg=gray
:hi ColorColumn ctermbg=gray

" == Misc ==

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

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Toggle number
nnoremap <Leader>n :set nonumber!<CR>
highlight LineNr ctermfg=Blue guifg=LightBlue

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

" map NERDTree to F2
map <F2> :NERDTreeTabsToggle<CR>

" map Tagbar to F8
nmap <F8> :TagbarToggle<CR>

" Navigate properly when lines are wrapped
noremap j gj
noremap k gk

" vimwiki
let g:vimwiki_list = [{'path': '~/.vimwiki/'}]

" Remove delay when exiting visual mode
set timeout timeoutlen=1000 ttimeoutlen=10

" == Fix Autoclose ==
" Set timeoutlen to a lower value in insert mode so that pressing ESC
" instantly gets in normal mode.
" Since vim-autoclose maps ESC in insert mode, it would take 1s to go back to
" normal mode without this.
":autocmd InsertEnter * set timeoutlen=10
":autocmd InsertLeave * set timeoutlen=1000
