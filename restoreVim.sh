#!/bin/bash

HOMEDIR=$(cd $(dirname "$0"); pwd)
VIM_HOME=~/.vim
VIM_COLORS=$VIM_HOME/colors # default: /usr/share/vim/vim74/colors
VIM_BUNDLE=$VIM_HOME/bundle
VIM_FONTS=$VIM_HOME/fonts

mkdir -p $VIM_HOME
mkdir -p $VIM_COLORS
mkdir -p $VIM_BUNDLE


# Install Vundle
rm -rf $VIM_BUNDLE/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git $VIM_BUNDLE/Vundle.vim

# Install Fonts
rm -rf $VIM_FONTS/repo
git clone https://github.com/powerline/fonts.git $VIM_FONTS/repo --depth=1
$VIM_FONTS/repo/install.sh

# Copy colors from bundles
cp $VIM_BUNDLE/tender/colors/* $VIM_COLORS/
cp $VIM_BUNDLE/simpleblack/colors/* $VIM_COLORS/

# Remove previous vimrc file
rm -f ~/.vimrc

# Restore vimrc file
ln -s $HOMEDIR/vimrc ~/.vimrc
ln -s $HOMEDIR/commands.sh ~/.commands.sh
ln -s $HOMEDIR/secrets.sh ~/.secrets.sh

#Download plugins
vim +PluginInstall +qall

