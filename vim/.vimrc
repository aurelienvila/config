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
Plugin 'tpope/vim-commentary' "Comment plugin
" gcc - comment/toggle a line 
" gc - to comment/toggle target of a move or with visual mode
" gcgc - to uncomments a set of adjacent commented lines




" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

"set keys
let mapleader = " "

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"split preferences
set splitbelow
set splitright

"flag unnecessary whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"YouCompleteMe conf
"<C-O> to jump back
"<C-I> to jump forward
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gd  :YcmCompleter GetDoc<CR>

let python_highlight_all=1

"Conf for file tree
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
nmap <F2> :NERDTreeToggle<CR>

" to enable flake8
filetype plugin on

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

"Highlight column over 100 for python

autocmd FileType python set colorcolumn=101
highlight ColorColumn ctermbg=darkred guibg=darkred


" from https://dougblack.io/words/a-good-vimrc.html
