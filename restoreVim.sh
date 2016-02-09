#!/bin/bash

#Install Vundle
mkdir -p ~/.vim/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Restore vimrc
cp vimrc ~/.vimrc

#Download plugins
vim +PluginInstall +qall
