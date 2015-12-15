#!/bin/bash

VUNDLE_DIR=~/.vim/bundle/Vundle.vim/
AWESOME_DIR=~/.awesome
LIBCLANG_INSTALLED=$(sudo ldconfig -p | grep libclang | wc -l)
LIBBOOST_INSTALLED=$(sudo ldconfig -p | grep libboost | wc -l)

if [ "$LIBCLANG_INSTALLED" -eq 0 ]; then
	echo "Please install libclang"
	exit;
fi

if [ "$LIBBOOST_INSTALLED" -eq 0 ]; then
	echo "Please install boost"
	exit;
fi

# get Vundle
if [ ! -d "$VUNDLE_DIR" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

#get oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# move the dotfiles
cp -i vimrc ~/.vimrc
cp -i tmux.conf ~/.tmux.conf
if [ ! -d "$AWESOME_DIR" ]; then
	mkdir -p ~/.awesome/
fi
cp -i awesome/rc.lua ~/.awesome/rc.lua
cp -i zshrc ~/.zshrc 
cp -i ycm_extra_conf.py ~/.ycm_extra_conf.py

# install vim plugins
vim +PluginInstall +qall

# build YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
python2 install.py --clang-completer --system-libclang --system-boost
