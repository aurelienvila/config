#!/bin/sh
DIR="$(dirname "$(readlink -f "$0")")" &&
ZSHRC=$DIR/.zshrc &&
echo $ZSHRC

sudo apt install curl zsh fonts-powerline -y &&

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&

rm $HOME/.zshrc
ln -s $ZSHRC $HOME 
