#!/bin/bash


# Ask for the administrator password upfront
sudo -v


export DOTFILES=`pwd`


if [ -z "`cat ~/.bashrc | grep '.bash_profile'`" ]; then
  echo "source ~/.bash_profile;" >> ~/.bashrc;
fi

if [ -z "`cat ~/.bash_profile | grep '/dotfiles'`" ]; then
  echo "source `pwd`/.spread" >> ~/.bash_profile;
fi

./symlinks.sh



./daemons.sh


## iterm integration
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash


./brew.sh




# non-brew packages


#sdk
curl -s get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

#sdk install grails
#sdk install groovy


# cheatly (cheat improvement)
gem install cheatly

# glances (system monitor)
sudo pip install glances


#howdoi - solutions/snippets on command line
sudo pip install howdoi

#jekyll
sudo gem install jekyll

# lolcommits - https://github.com/mroth/lolcommits
sudo gem install lolcommits
sudo gem install lolcat

# tldr (short man)
sudo npm install -g tldr

# iterm tab color
sudo npm install -g iterm2-tab-set

# front-end deps
sudo npm install -g gulp
sudo npm install -g bower

sudo easy_install Pygments
sudo easy_install pip

cp ./fonts/Inconsolata.otf ~/Library/Fonts




wget https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat -O /usr/local/bin/imgcat
chmod +x /usr/local/bin/imgcat

if [ "$(uname -s)" == "Darwin" ]; then
  wget https://bahoom.com/hyperswitch/HyperSwitch.zip
  unzip HyperSwitch.zip -d ~/Applications


  #redirect everything that's .build to local
  mkdir -pv $(brew --prefix)/etc/ && \
  echo 'address=/.build/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf && \
  sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons && \
  sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist && \
  sudo mkdir -v /etc/resolver && \
  sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/build'

  sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder


fi
