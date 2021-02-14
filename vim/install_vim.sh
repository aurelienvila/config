#!/bin/sh

DIR="$(dirname "$(readlink -f "$0")")"
VIMRC=$DIR/.vimrc

echo $VIMRC

sudo apt install libncurses5-dev libgtk2.0-dev libatk1.0-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python2-dev \
python3-dev ruby-dev lua5.2 liblua5.2-dev libperl-dev git \
build-essential python3-pip cmake -y &&

cd $HOME/src
git clone https://github.com/vim/vim.git &&
cd vim &&
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local &&


make VIMRUNTIMEDIR=/usr/local/share/vim/vim82 &&
sudo make install -j8 &&

sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1 &&
sudo update-alternatives --set editor /usr/local/bin/vim &&

rm $HOME/.vimrc
ln -s $VIMRC $HOME &&

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim &&

python3 -m pip install ropevim &&

vim -E +PluginInstall +qall &&

cd $HOME/.vim/bundle/YouCompleteMe &&

python3 install.py --clang-completer
    
