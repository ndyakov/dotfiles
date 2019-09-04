#!/bin/bash
dotfiles=`pwd`

#./brewery.sh

rm $HOME/.gitconfig

if [ -d "$HOME/.vim" ]; then
    rm -rf $HOME/.vim
fi

if [ -d "$HOME/.tmux" ]; then
    rm -rf $HOME/.tmux
fi

if [ ! -d "$HOME/.config/nvim" ]; then
    rm -rf $HOME/nvim
fi

echo "clean config"
