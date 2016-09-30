#!/bin/bash

VUNDLE_DIR=~/.vim/bundle/Vundle.vim/
AWESOME_DIR=~/.awesome
QTILE_DIR=~/.config/qitle
LIBCLANG_INSTALLED=$(ldconfig -p | grep libclang | wc -l)
LIBBOOST_INSTALLED=$(ldconfig -p | grep libboost | wc -l)

function configure_awesome {

	if [ ! -d "$AWESOME_DIR" ]; then
		mkdir -p ~/.awesome/
	fi
	cp -i awesome/rc.lua ~/.awesome/rc.lua
}

function configure_qtile {

	if [ ! -d "$QTILE_DIR" ]; then
		mkdir -p ~/.awesome/
	fi
	cp -i qtile/config.py ~/.config/qtile/config.py
}

function install_ycm {

	if [ "$LIBCLANG_INSTALLED" -eq 0 ]; then
		echo "Please install libclang"
		exit;
	fi

	if [ "$LIBBOOST_INSTALLED" -eq 0 ]; then
		echo "Please install boost"
		exit;
	fi

	# build YouCompleteMe
	cd ~/.vim/bundle/YouCompleteMe
	python2 install.py --clang-completer --system-libclang --system-boost
}

while true; do
	read -p "Do you wish to set up YouCompleteMe using this script? `echo $'\n '`" yn
	case $yn in
		[Yy]* ) INSTALL_YCM=yes; break;;
		[Nn]* ) INSTALL_YCM=no; break;;
		* ) echo "Please answer yes or no."
	esac
done

while true; do
	read -p "Do you want to use qtile? `echo $'\n '`" yn
	case $yn in
		[Yy]* ) CONFIGURE_QTILE=yes; break;;
		[Nn]* ) CONFIGURE_QTILE=no; break;;
		* ) echo "Please answer yes or no."
	esac
done

while true; do
	read -p "Do you want to use awesome? `echo $'\n '`" yn
	case $yn in
		[Yy]* ) CONFIGURE_AWESOME=yes; break;;
		[Nn]* ) CONFIGURE_AWESOME=no; break;;
		* ) echo "Please answer yes or no."
	esac
done


# get Vundle
if [ ! -d "$VUNDLE_DIR" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

#get oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# move the dotfiles
cp -i vimrc ~/.vimrc
cp -i tmux.conf ~/.tmux.conf
cp -i zshrc ~/.zshrc 
cp -i ycm_extra_conf.py ~/.ycm_extra_conf.py

if [ $CONFIGURE_QTILE = "yes" ]; then
	configure_qtile
fi

if [ $CONFIGURE_AWESOME = "yes" ]; then
	configure_awesome
fi

if [ $INSTALL_YCM = "yes" ]; then
	install_ycm
fi

# install vim plugins
vim +PluginInstall +qall

