#!/bin/bash


# Ask for the administrator password upfront
sudo -v

if [ "$(uname -s)" == "Darwin" ]; then
  # get the command line tools!
  xcode-select --install

  # you have to do this at some point
  sudo xcodebuild -license accept

  # install brew
  if ! hash brew 2> /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

elif [ "$(uname -s)" == "Linux" ]; then

  if hash apt-get 2> /dev/null; then
    sudo apt-get install build-essential -y
    sudo apt-get install ruby -y
    sudo apt-get install npm -y

    sudo apt-get install nodejs -y
    sudo ln -s /usr/bin/nodejs /usr/bin/node
  fi


  # install brew
  if ! hash brew 2> /dev/null; then

    if ! hash ruby 2> /dev/null; then
      echo_failure "Ruby is not available. Can not install Brew."
      return
    fi

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/linuxbrew/go/install)"
  fi

  export PATH=~/.linuxbrew/bin:~/.linuxbrew/sbin:$PATH

fi



### updates


brew update
brew upgrade


#zsh
#brew install zsh zsh-completions
#curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
#chsh -s /usr/local/bin/zsh


#use new bash
brew install bash

# Add the new shell to the list of allowed shells
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'

# Change to the new shell
chsh -s /usr/local/bin/bash



#Cask
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions


# useful



################# code
# regular bash-completion package is held back to an older release, so we get latest from versions.
# github.com/Homebrew/homebrew/blob/master/Library/Formula/bash-completion.rb#L3-L4
brew tap homebrew/versions
brew install bash-completion2

brew install homebrew/completions/brew-cask-completion


#install better versions of tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen


# tools
brew install node
brew install git
brew install wget --with-iri
brew install tree
brew install maven
brew install ant
brew install python
brew install jq
brew install scala

# GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
brew install moreutils

# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils

# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --default-names


################## h4x
brew install binutils
#cipher detection
brew install cifer
#zip cracker
brew install fcrackzip
#logon crack
brew install hydra
#pwd crack
brew install john



# cfr-decompiler - java decompiler
brew install cfr-decompiler

# file system watch
# fswatch -o ~/path/to/watch | xargs -n1 ~/script/to/run/when/files/change.sh
brew install fswatch

#autojump - jump to directory (j) or child dir (jc)
brew install autojump



################### general

#read exif from files
brew install exiftool





#youtube downloader
brew install youtube-dl

#pipe viewer
brew install pv


#aldo - learn morse code
brew install aldo

#ansiweather - ansiweather -l {location}
brew install ansiweather

#conversor
brew install pandoc

#history
brew install hh

#network tool
brew install nmap

#terminal tool
brew install tmux # ctrl+b default


#dnsmasq
brew install dnsmasq


# port redirection
brew install homebrew/binary/ngrok2


# Keybase
brew install keybase



#Git-Hub
brew install hub


#htop - top substitor
brew install htop


# http parser - hxnormalize, hxselect
brew install html-xml-utils


#command line tool for processing HTML
brew install pup

#googler
brew install googler

# ncdu - better treesize
brew install ncdu

# iftop - where's bandwidth going
brew install iftop

# gist - gist -P (clipboard), gist -d "Random rbx bug" a.java
brew install gist

# control chrome from cmd // chrome-cli list tabs
brew install chrome-cli

# convert endlines - dos2unix
brew install dos2unix


# mac spoofing - free wifi forever on airports :) - sudo spoof-mac randomize en0
brew install spoof-mac


#translate - $ trans "Oi, Mundo", $ trans -brief pt:en "Oi Mundo"
brew install translate-shell

# maven-color, maven-notifier and maven-profiler
brew tap jcgay/jcgay
brew install maven-deluxe
brew link --overwrite maven-deluxe


# silver searcher - ag
brew install the_silver_searcher

# company ios dependencies
brew install swiftlint
brew install carthage


# crashhub - java/jvm bash // http://www.crashub.org/1.3/reference.html
#brew install crash

# bsh (beanshell)
#wget http://www.beanshell.org/bsh-2.0b4.jar -O /usr/local/bin/bsh.jar

# Java REPL better than BSH :)
brew install javarepl


# Diff-so-fancy (diff a b | diff-so-fancy)
brew install diff-so-fancy
git config --global pager.diff "diff-so-fancy | less --tabs=4 -RFX" && \
git config --global pager.show "diff-so-fancy | less --tabs=4 -RFX"


# hack font
brew cask install caskroom/fonts/font-hack



# ffmpeg
brew install ffmpeg

# imagemagick
brew install imagemagick

# mtr - ping & traceroute. best.
brew install mtr

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr



## Mac OS X Only stuff

if [ "$(uname -s)" == "Darwin" ]; then

  # archey - system information
  brew install archey


  #window resizing
  brew cask install spectacle
  brew cask install vlc

  # Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
  brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package


  # File Archiver Management
  brew cask install keka

  # gif screenshot
  brew cask install licecap

  # Core casks
  brew cask install --appdir="/Applications" alfred
  brew cask install --appdir="/Applications" iterm2
  brew cask install --appdir="/Applications" java
  brew cask install --appdir="/Applications" xquartz
  brew cask install --appdir="/Applications" atom
  brew cask install --appdir="/Applications" virtualbox
  brew cask install --appdir="/Applications" vagrant
  brew cask install --appdir="/Applications" macdown
  brew cask install --appdir="/Applications" mactex


  #prevent mac from sleeping
  brew install caffeine


  brew install terminal-notifier



fi
