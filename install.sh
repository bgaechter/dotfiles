#!/bin/bash

# get Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#get oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# move the dotfiles
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf
mkdir -p ~/.awesome/
cp awesome/rc.lua ~/.awesome/rc.lua
cp zshrc ~/.zshrc 

# install vim plugins
vim +PluginInstall +qall


