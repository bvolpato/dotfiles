#!/bin/bash


# Ask for the administrator password upfront

DOTFILES=`pwd`


echo "[+] Unloading..."

#launchctl unload -w ~/Library/LaunchAgents/org.brunocvcunha.personal.audiohijack.plist || true
launchctl unload -w ~/Library/LaunchAgents/org.brunocvcunha.personal.jenkins.plist || true

if [ -f /Library/LaunchAgents/org.brunocvcunha.personal.updatedb.plist ]; then
  sudo launchctl unload -w /Library/LaunchAgents/org.brunocvcunha.personal.updatedb.plist || true
fi

echo "[+] Copying..."
#ln -s $DOTFILES/launchctl/org.brunocvcunha.personal.audiohijack.plist ~/Library/LaunchAgents/ || true
ln -s $DOTFILES/launchctl/org.brunocvcunha.personal.jenkins.plist ~/Library/LaunchAgents/ || true
sudo cp $DOTFILES/launchctl/org.brunocvcunha.personal.updatedb.plist /Library/LaunchAgents/ || true


echo "[+] Loading..."

#launchctl load -w ~/Library/LaunchAgents/org.brunocvcunha.personal.audiohijack.plist
launchctl load -w ~/Library/LaunchAgents/org.brunocvcunha.personal.jenkins.plist

sudo chmod 600 /Library/LaunchAgents/org.brunocvcunha.personal.updatedb.plist
sudo chown root /Library/LaunchAgents/org.brunocvcunha.personal.updatedb.plist
sudo launchctl load -w /Library/LaunchAgents/org.brunocvcunha.personal.updatedb.plist

echo "[+] Done!"
