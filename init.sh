#!/bin/bash
dotfiles=`pwd`

#git submodule init
#git submodule update

#./brewery.sh

#ln -s $dotfiles/git/gitconfig $HOME/.gitconfig

#echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

#chsh -s /usr/local/bin/fish

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

echo "\n 1.now run fisher in fish"
echo "\n 2.run tmux and install plugins"
echo "\n 3.run vim and install plugins"
