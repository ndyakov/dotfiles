#!/bin/bash
dotfiles=`pwd`

git submodule init
git submodule update

# install things from brew
./brewery.sh

ln -s $dotfiles/git/gitconfig $HOME/.gitconfig

echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells

chsh -s /opt/homebrew/bin/fish

# download fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

if [ ! -d "$HOME/.vim" ]; then
    ln -s $dotfiles/vim/ $HOME/.vim
    ln -s $HOME/.vim/vimrc $HOME/.vimrc
fi

if [ ! -d "$HOME/.tmux" ]; then
    ln -s $dotfiles/tmux/ $HOME/.tmux
    ln -s $HOME/.tmux/tmux.conf $HOME/.tmux.conf
fi

cp "$dotfiles/fish/fish_plugins"  $HOME/.config/fish/fish_plugins
cp "$dotfiles/fish/fish_variables"  $HOME/.config/fish/fish_variables
echo "$dotfiles/fish/ndyakov" >> $HOME/.config/fish/fish_plugins

./nvim.sh

./secrets.sh

echo "1.now run fisher in fish"
echo "2.run tmux and install plugins"
echo "3.run vim and install plugins"
