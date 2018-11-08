#!/bin/bash

ensure () {
    which $1 || brew install $1
}

which g || curl -sSL https://git.io/g-install | bash -s -- fish
which go || g install latest

which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

which n || curl -L https://git.io/n-install | bash
which node || n latest

ensure git
ensure wget
ensure fish
ensure nvim
ensure tig
ensure rg
ensure direnv
ensure fzf
ensure php
ensure tmux
ensure watch
ensure nmap
ensure reattach-to-user-namespace
ensure diff-so-fancy
ensure highlight
ensure htop
ensure iftop
ensure cmatrix
ensure asciinema
ensure coreutils
ensure the_silver_searcher
