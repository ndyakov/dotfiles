home_dir=${HOME:-~}

if [ ! -d "$home_dir/.config/nvim" ]; then
    ln -s $dotfiles/nvim/ $home_dir/.config/nvim
fi
gem install neovim
npm install -g neovim
python3 -m pip install --user --upgrade pynvim
gem install neovim
