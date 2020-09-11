"""""""""""""""""""""""""""""""""""""
" Aurelien Vila Vimrc configuration 
" Inspired from : https://dev.to/allanmacgregor/vim-is-the-perfect-ide-e80
" and : https://realpython.com/vim-and-python-a-match-made-in-heaven/
"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
" Set ipdb breakpoints script
"""""""""""""""""""""""""""""""""""""
func! s:SetBreakpoint()
    cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import ipdb; ipdb.set_trace()')
endf

func! s:RemoveBreakpoint()
    exe 'silent! g/^\s*import\sipdb\;\?\n*\s*ipdb.set_trace()/d'
endf

func! s:ToggleBreakpoint()
    if getline('.')=~#'^\s*import\sipdb' | cal s:RemoveBreakpoint() | el | cal s:SetBreakpoint() | en
endf
nnoremap <F6> :call <SID>ToggleBreakpoint()<CR>

"""""""""""""""""""""""""""""""""""""
" Run current python script in a new terminal
"""""""""""""""""""""""""""""""""""""
:command! -nargs=1 Silent execute <q-args> | execute ':redraw!'

func s:GetPythonInterp()
        let s:ycm_conf_path = execute(':pwd') . "/.ycm_extra_conf.py"
        echom s:ycm_conf_path
        if !empty(glob("./.ycm_extra_conf.py"))
                return split(readfile('./.ycm_extra_conf.py')[2], ":")[-1]
        endif
        return "python3"
endf

func! s:NewTerminal()
        " :silent !gnome-terminal -- ls & disown & 
        " let s:run_cmd="ls .; exec zsh"
        " :Silent gnome-terminal -- zsh -c run_cmd & disown & 
        let s:interpreter = s:GetPythonInterp()
        Silent execute ":silent ! gnome-terminal -- zsh -c \"". s:interpreter. " -m ipdb -c continue " . expand('%:p') . "; exec zsh\""
endf

nnoremap <F7> :call <SID>NewTerminal()<CR>

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
"Plugin 'nvie/vim-flake8'                 "Pep8 Syntax correction
Plugin 'scrooloose/nerdtree'             "File tree
Plugin 'jistr/vim-nerdtree-tabs'         "Use tab for file tree
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'tpope/vim-commentary' "Comment plugin
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Version not merged yet in tmhedberg to fold function definitions 
"Plugin 'Siddarth-Raghuvanshi/SimpylFold'

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
" let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_auto_hover = 'CursorHold'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gd  :YcmCompleter GetDoc<CR>
nmap <leader>D <plug>(YCMHover)

set balloonexpr=YCMHover()
set ballooneval
set balloonevalterm

let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
""""""""""""


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
set background=light
let g:solarized_termcolors=256
" colorscheme solarized
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

"

"SimpyFold conf
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_import=0
nnoremap <space> za

"Set a breakpoint register
let @b="        import ipdb; ipdb.set_trace()"

"vim flake8 config
let g:flake8_show_in_gutter=1
"autocmd BufWritePost *.py call flake8#Flake8()

"Syntastic config
let g:syntastic_python_checkers = ['flake8']

"yaml config
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab




