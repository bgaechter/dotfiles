set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'ycm-core/YouCompleteMe'

" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

filetype plugin indent on     " required!
filetype plugin on
filetype on
"======Solarized theme============
syntax on
syntax enable
let g:solarized_termtrans = 1
set background=dark
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized


set autoindent    " always set autoindenting on
set backspace=indent,eol,start          " allow backspacing over everything in insert mode
set copyindent    " copy the previous indentation on
set cursorline
set cursorcolumn
set foldlevel=99    "folding"
set foldmethod=indent
set hidden
set history=1000         " remember more commands and search history
set hlsearch      "
set ignorecase    " ignore case when searching
set incsearch     "
set laststatus=2
set noerrorbells         " don't beep
set nowrap        " don't wrap lines
set number        " always show line numbers
set ruler
set shiftwidth=2  " number of spaces to use for
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showcmd
set showmatch     " set show matching parenthesis
set smartcase     " ignore case if search pattern is all lowercase,
set smarttab      " insert tabs on the
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set tabstop=2     " a tab is four spaces
set showtabline=2
set title                " change the terminal's title
set ttyfast
set undolevels=1000      " use many muchos levels of undo
set visualbell           " don't beep
set wildignore=*.swp,*.bak,*.pyc,*.class

let g:airline#extensions#tabline#enabled = 1
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let mapleader=","

let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")

autocmd filetype python set expandtab

map <C-o> :NERDTreeToggle<CR>
map <C-n> :nohlsearch<CR>
inoremap <leader>o <esc>o<cr>i
nnoremap <silent> <leader>b :TagbarToggle<CR>
nnoremap <leader>. :CtrlPTag<cr>