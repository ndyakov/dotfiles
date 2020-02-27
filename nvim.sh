if [ ! -d "$HOME/.config/nvim" ]; then
    ln -s $dotfiles/nvim/ $HOME/.config/nvim
fi
gem install neovim
npm install -g neovim
python3 -m pip install --user --upgrade pynvim
gem install neovim
