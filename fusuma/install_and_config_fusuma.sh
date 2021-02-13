#!/bin/sh

# https://github.com/iberianpig/fusuma

DIR="$(dirname "$(readlink -f "$0")")" &&
SERVICE=$DIR/fusuma@.service &&
CONFIG=$DIR/config.yml &&
CONFIG_DIR=$HOME/.config/fusuma &&

sudo gpasswd -a $USER input &&

sudo apt install libinput-tools ruby xdotool -y &&
sudo gem install fusuma &&

sudo ln -s $SERVICE /lib/systemd/system &&
mkdir $CONFIG_DIR &&
ln -s $CONFIG $CONFIG_DIR &&

systemctl enable fusuma@$USER.service
