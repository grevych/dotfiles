#!/bin/bash

#Install Pathogen

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#Plugins
#All vimrc configuration needed by them is supplied in my vimrc

git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone https://github.com/sjl/gundo.vim.git ~/.vim/bundle/gundo
git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab
git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
git clone https://github.com/SirVer/ultisnips.git ~/.vim/bundle/ultisnips
git clone git://github.com/majutsushi/tagbar ~/.vim/bundle/tagbar
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone git://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround
git clone https://github.com/mattn/emmet-vim.git ~/.vim/bundle/emmet-vim

#Colors
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim/colors
mv ~/.vim/colors/colors/* ~/.vim/colors
rm -rf ~/.vim/colors/colors

#Restore vimrc
cp vimrc ~/.vimrc
