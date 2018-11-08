#!/bin/bash
dotfiles=`pwd`

#./brewery.sh

ln -s $dotfiles/git/gitconfig $HOME/.gitconfig

if [ ! -d "$HOME/.vim" ]; then
    ln -s $dotfiles/vim/ $HOME/.vim
    ln -s $HOME/.vim/vimrc $HOME/.vimrc
fi

if [ ! -d "$HOME/.tmux" ]; then
    ln -s $dotfiles/tmux/ $HOME/.tmux
    ln -s $HOME/.tmux/tmux.conf $HOME/.tmux.conf
fi

if [ ! -d "$HOME/.config/nvim" ]; then
    ln -s $dotfiles/nvim/ $HOME/.config/nvim
fi

echo "$dotfiles/fish" > $HOME/.config/fish/fishfile
echo "now run fisher in fish"
