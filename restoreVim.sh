#!/bin/bash

HOMEDIR=$(cd $(dirname "$0"); pwd)
VIM_HOME=~/.vim
VIM_COLORS=$VIM_HOME/colors
VIM_BUNDLE=$VIM_HOME/bundle

mkdir -p $VIM_HOME
mkdir -p $VIM_COLORS
mkdir -p $VIM_BUNDLE


# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git $VIM_BUNDLE/Vundle.vim

# Remove previous vimrc file
rm -f ~/.vimrc
ln -s $HOMEDIR/vundlerc ~/.vimrc

#Download plugins
vim +PluginInstall +qall

# Copy colors from bundles
cp $VIM_BUNDLE/tender/colors/* $VIM_COLORS/

# Restore vimrc file
ln -s $HOMEDIR/vimrc ~/.vimrc

