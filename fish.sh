#!/bin/bash
dotfiles=`pwd`
cp "$dotfiles/fish/fish_plugins" $HOME/.config/fish/fish_plugins
cp "$dotfiles/fish/fish_variables" $HOME/.config/fish/fish_variables
echo "$dotfiles/fish/ndyakov" >> $HOME/.config/fish/fish_plugins
