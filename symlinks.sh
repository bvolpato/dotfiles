#!/bin/bash

# ln -s ~/githubworkspace/dotfiles/.bashrc ~/.bashrc
# ln -s ~/githubworkspace/dotfiles/.bash_profile ~/.bash_profile

ln -sf ~/githubworkspace/dotfiles/.bowerrc ~/.bowerrc
ln -sf ~/githubworkspace/dotfiles/.wgetrc ~/.wgetrc
ln -sf ~/githubworkspace/dotfiles/.curlrc ~/.curlrc
ln -sf ~/githubworkspace/dotfiles/.inputrc ~/.inputrc
ln -sf ~/githubworkspace/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/githubworkspace/dotfiles/.osx ~/.osx
ln -sf ~/githubworkspace/dotfiles/.gitignore_global ~/.gitignore_global

ln -s ~/githubworkspace/dotfiles/.vimrc ~/.vimrc
ln -s ~/githubworkspace/dotfiles/.vim/ ~/

#create empty folders
mkdir ~/.vim/swaps
mkdir ~/.vim/backups
mkdir ~/.vim/undo
