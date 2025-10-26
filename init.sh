#!/bin/bash
dotfiles=`pwd`
home_dir=${HOME:-~}

# Process template files first
echo "Processing templates..."
cd template-processor
go run main.go
cd ..

git submodule init
git submodule update

# install things from brew
./brewery.sh

ln -s $dotfiles/git/gitconfig $home_dir/.gitconfig

echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells

chsh -s /opt/homebrew/bin/fish

# download fisher
curl https://git.io/fisher --create-dirs -sLo $home_dir/.config/fish/functions/fisher.fish

if [ ! -d "$home_dir/.vim" ]; then
    ln -s $dotfiles/vim/ $home_dir/.vim
    ln -s $home_dir/.vim/vimrc $home_dir/.vimrc
fi

if [ ! -d "$home_dir/.tmux" ]; then
    ln -s $dotfiles/tmux/ $home_dir/.tmux
    ln -s $home_dir/.tmux/tmux.conf $home_dir/.tmux.conf
fi

cp "$dotfiles/fish/fish_plugins"  $home_dir/.config/fish/fish_plugins
cp "$dotfiles/fish/fish_variables"  $home_dir/.config/fish/fish_variables
echo "$dotfiles/fish/ndyakov" >> $home_dir/.config/fish/fish_plugins

./nvim.sh

# Link IdeaVim configuration
if [ ! -f "$home_dir/.ideavimrc" ]; then
    ln -s $dotfiles/idea/vimrc $home_dir/.ideavimrc
fi

# Link lsd configuration
if [ -d "$home_dir/.config/lsd" ]; then
    rm -rf $home_dir/.config/lsd
fi
ln -sf $dotfiles/lsd $home_dir/.config/lsd

# Link gnupg configuration
if [ ! -d "$home_dir/.gnupg" ]; then
    mkdir -p $home_dir/.gnupg
    chmod 700 $home_dir/.gnupg
fi
ln -sf $dotfiles/gnupg/gpg-agent.conf $home_dir/.gnupg/gpg-agent.conf

./secrets.sh

echo "1.now run fisher in fish"
echo "2.run tmux and install plugins"
echo "3.run vim and install plugins"
