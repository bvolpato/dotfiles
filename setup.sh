#!/bin/bash


# Ask for the administrator password upfront
sudo -v


export DOTFILES=`pwd`



if [ -z "`cat ~/.zshrc | grep '/dotfiles'`" ]; then
  echo "source `pwd`/.spread" >> ~/.zshrc;
fi

./symlinks.sh


./daemons.sh


## iterm integration
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash


./brew.sh





#sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java 21-tem
sdk install gradle


# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.zshrc

nvm install 22


# tldr (short man)
npm install -g tldr

# speed-test
npm install -g speed-test



if [ "$(uname -s)" == "Darwin" ]; then


# fonts
cp ./fonts/* ~/Library/Fonts/


else

cp ./fonts/* /usr/local/share/fonts/

fi