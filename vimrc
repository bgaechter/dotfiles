set nocompatible              " be iMproved
filetype off                  " required!

"set rtp+=~/.vim/bundle/Vundle.vim/
"call vundle#rc()
call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'gmarik/Vundle.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'ycm-core/YouCompleteMe'
Plug 'fatih/vim-go'
Plug 'nvie/vim-flake8'
Plug 'vim-syntastic/syntastic'
Plug 'hashivim/vim-terraform'

call plug#end()

" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

filetype plugin indent on     " required!
filetype plugin on
filetype on
syntax on
syntax enable
set background=dark
set t_Co=256
colorscheme molokai


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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

" Currently not working properly
let g:ycm_language_server = [
			\   {
			\     'name': 'terraform',
			\     'cmdline': [ '/usr/local/bin/terraform-ls', 'serve' ],
			\     'filetypes': [ 'terraform', 'tf' ]
			\   }
			\ ]

let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_goto_buffer_command = 'split-or-existing-window'

let python_highlight_all=1
let g:ycm_autoclose_preview_window_after_completion=1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Create default mappings
let g:NERDCreateDefaultMappings = 0

map <leader>c :call NERDComment(0,"toggle")<CR>

autocmd filetype python set expandtab
map <C-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <C-f> :YcmCompleter FixIt<CR>
map <C-d> :YcmCompleter GetDoc<CR>
map <C-l> :YcmCompleter Format<CR>
map <C-s> :tab split<CR>

map <C-o> :NERDTreeToggle<CR>

map <C-n> :nohlsearch<CR>

map <C-i> :GoImport<CR>
map <C-b> :GoBuild<CR>
map <C-r> :GoRun<CR>
map <C-v> :GoMetaLinter<CR>
