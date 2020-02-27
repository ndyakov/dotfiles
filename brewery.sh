#!/bin/bash

ensure () {
    if brew ls --versions $1 > /dev/null; then
        # The package is installed
        echo "$1 installed..."
    else
        brew install $1
    fi
}

which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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
ensure gnupg
ensure pinentry-mac
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent


