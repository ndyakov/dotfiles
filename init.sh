#!/bin/bash
dotfiles=`pwd`

git submodule init
git submodule update

# install things from brew
./brewery.sh

ln -s $dotfiles/git/gitconfig $HOME/.gitconfig

echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

chsh -s /usr/local/bin/fish

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

if [ ! -d "$HOME/.config/nvim" ]; then
    ln -s $dotfiles/nvim/ $HOME/.config/nvim
fi

echo "$dotfiles/fish" > $HOME/.config/fish/fishfile

gem install neovim

npm install -g neovim

python3 -m pip install --user --upgrade pynvim

gem install neovim


echo "1.now run fisher in fish"
echo "2.run tmux and install plugins"
echo "3.run vim and install plugins"
