# Vim configuration

Configurations is inspired from following websites : 

- https://realpython.com/vim-and-python-a-match-made-in-heaven/
- https://dev.to/allanmacgregor/vim-is-the-perfect-ide-e80

## Step summary

**Install Vundle**

`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

`touch ~/.vimrc`

**Install YouCompleteMe**

https://github.com/ycm-core/YouCompleteMe#python-semantic-completion

Compiling YCM with semantic support for C-family languages through libclang:

`cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer`

Or Compiling YCM without semantic support for C-family languages:

`cd ~/.vim/bundle/YouCompleteMe
python3 install.py`





