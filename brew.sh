#!/bin/bash

# get the command line tools!
xcode-select --install

# you have to do this at some point
sudo xcodebuild -license accept

# install brew
if ! hash brew 2> /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

#use new bash
brew install bash

# Add the new shell to the list of allowed shells
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell
chsh -s /usr/local/bin/bash



brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions


# useful

#window resizing
brew cask install spectacle
brew cask install vlc



# tools
brew install node
brew install git
brew install wget --with-iri
brew install tree
brew install maven


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


#autojump - jump to directory (j) or child dir (jc)
brew install autojump

################### general

#read exif from files
brew install exiftool

################# code
# regular bash-completion package is held back to an older release, so we get latest from versions.
#   github.com/Homebrew/homebrew/blob/master/Library/Formula/bash-completion.rb#L3-L4
brew tap homebrew/versions
brew install bash-completion2

brew install homebrew/completions/brew-cask-completion


#install better versions of tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen


brew install terminal-notifier


#prevent mac from sleeping
brew install caffeine

#youtube downloader
brew install youtube-dl

#pipe viewer
brew install pv


#conversor
brew install pandoc

#history
brew install hh

#network
brew install nmap

#terminal tool
brew install tmux # ctrl+b default

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

# File Archiver Management
brew cask install keka


# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
#brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

#Dark Mode
#brew install dark-mode

#Git-Hub
brew install hub


# mtr - ping & traceroute. best.
brew install mtr

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr
