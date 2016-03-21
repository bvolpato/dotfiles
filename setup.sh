#!/bin/bash

sudo easy_install Pygments
sudo easy_install pip

cp ./fonts/Inconsolata.otf ~/Library/Fonts

./brew.sh


wget https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat -O /usr/local/bin/imgcat
chmod +x /usr/local/bin/imgcat


wget https://bahoom.com/hyperswitch/HyperSwitch.zip
unzip HyperSwitch.zip -d ~/Applications
