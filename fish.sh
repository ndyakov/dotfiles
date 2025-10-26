#!/bin/bash
dotfiles=`pwd`
home_dir=${HOME:-~}

cp "$dotfiles/fish/fish_plugins" $home_dir/.config/fish/fish_plugins
cp "$dotfiles/fish/fish_variables" $home_dir/.config/fish/fish_variables
echo "$dotfiles/fish/ndyakov" >> $home_dir/.config/fish/fish_plugins
