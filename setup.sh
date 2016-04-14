#!/bin/bash


# Ask for the administrator password upfront
sudo -v


if [ -z "`cat ~/.bashrc | grep '.bash_profile'`" ]; then
  echo "source ~/.bash_profile;" >> ~/.bashrc;
fi

if [ -z "`cat ~/.bash_profile | grep '/dotfiles'`" ]; then
  echo "source `pwd`/.spread" >> ~/.bash_profile;
fi

./symlinks.sh


## iterm integration
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash


./brew.sh




# non-brew packages


# cheatly (cheat improvement)
gem install cheatly

# glances (system monitor)
sudo pip install glances


#howdoi - solutions/snippets on command line
sudo pip install howdoi



# lolcommits - https://github.com/mroth/lolcommits
sudo gem install lolcommits
sudo gem install lolcat

# tldr (short man)
npm install -g tldr




sudo easy_install Pygments
sudo easy_install pip

cp ./fonts/Inconsolata.otf ~/Library/Fonts




wget https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat -O /usr/local/bin/imgcat
chmod +x /usr/local/bin/imgcat

if [ "$(uname -s)" == "Darwin" ]; then
  wget https://bahoom.com/hyperswitch/HyperSwitch.zip
  unzip HyperSwitch.zip -d ~/Applications
fi
