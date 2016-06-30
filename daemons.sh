#!/bin/bash


# Ask for the administrator password upfront

DOTFILES=`pwd`


launchctl unload -w ~/Library/LaunchAgents/org.brunocvcunha.personal.audiohijack.plist || true

if [ -f /Library/LaunchAgents/org.brunocvcunha.personal.updatedb.plist ]; then
  sudo launchctl unload -w /Library/LaunchAgents/org.brunocvcunha.personal.updatedb.plist || true
fi

cp $DOTFILES/launchctl/org.brunocvcunha.personal.audiohijack.plist ~/Library/LaunchAgents/
sudo cp $DOTFILES/launchctl/org.brunocvcunha.personal.updatedb.plist /Library/LaunchAgents/

launchctl load -w ~/Library/LaunchAgents/org.brunocvcunha.personal.audiohijack.plist

sudo chmod 600 /Library/LaunchAgents/org.brunocvcunha.personal.updatedb.plist
sudo chown root /Library/LaunchAgents/org.brunocvcunha.personal.updatedb.plist
sudo launchctl load -w /Library/LaunchAgents/org.brunocvcunha.personal.updatedb.plist
