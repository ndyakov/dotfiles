#!/bin/bash
dotfiles=`pwd`
home_dir=${HOME:-~}

#./brewery.sh

rm $home_dir/.gitconfig

if [ -d "$home_dir/.vim" ]; then
    rm -rf $home_dir/.vim
fi

if [ -d "$home_dir/.tmux" ]; then
    rm -rf $home_dir/.tmux
fi

if [ ! -d "$home_dir/.config/nvim" ]; then
    rm -rf $home_dir/nvim
fi

echo "clean config"
