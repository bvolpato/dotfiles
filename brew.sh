#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions


# useful
brew cask install spectacle
brew cask install vlc


# tools
brew install node
brew install git
brew install wget
brew install tree

# GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --default-names


# regular bash-completion package is held back to an older release, so we get latest from versions.
#   github.com/Homebrew/homebrew/blob/master/Library/Formula/bash-completion.rb#L3-L4
brew tap homebrew/versions
brew install bash-completion2

brew install homebrew/completions/brew-cask-completion


brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen


brew install terminal-notifier



#pipe viewer
brew install pv


# mtr - ping & traceroute. best.
brew install mtr

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr
