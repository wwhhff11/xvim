#!/bin/bash

if test -f ~/.vimrc; then
	mv ~/.vimrc ~/.vimrc.bak
fi
ln -s ~/xvim/.vimrc ~

if test -f ~/.vimrc.bundles;then 
	mv ~/.vimrc.bundles ~/.vimrc.bundles.bak
fi
ln -s ~/xvim/.vimrc.bundles ~

if test -d ~/.vim;then
	mv ~/.vim ~/.vim.bak
fi
ln -s ~/xvim/.vim ~
