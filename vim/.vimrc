"""""""""""""""""""""""""""""""""""""
" Aurelien Vila Vimrc configuration 
" Inspired from : https://dev.to/allanmacgregor/vim-is-the-perfect-ide-e80
" and : https://realpython.com/vim-and-python-a-match-made-in-heaven/
"""""""""""""""""""""""""""""""""""""

set nocompatible
syntax on
set nowrap
set encoding=utf8

"""" START Vundle Configuration 

" Disable file type for vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Python plugins
Plugin 'vim-scripts/indentpython.vim'    "Auto indentation
Plugin 'Valloric/YouCompleteMe'          "Auto completion
Plugin 'vim-syntastic/syntastic'         "Syntax correction
Plugin 'vim-python/python-syntax'
Plugin 'nvie/vim-flake8'                 "Pep8 Syntax correction
Plugin 'scrooloose/nerdtree'             "File tree
Plugin 'jistr/vim-nerdtree-tabs'         "Use tab for file tree
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'




" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"split preferences
set splitbelow
set splitright

"flag unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"YouCompleteMe conf
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1

"Conf for file tree
autocmd vimenter * NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"Color plugin conf
"set background=light
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme zenburn


set number
set showcmd
set cursorline
set expandtab
set tabstop=4
filetype indent on 
set wildmenu
set showmatch
set incsearch
set hlsearch
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $

" from https://dougblack.io/words/a-good-vimrc.html
