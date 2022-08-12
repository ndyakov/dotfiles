# vi bindings
set -u fish_plugins autojump vi-mode
set -u vi_mode_default vi_mode_normal
set -u fish_key_bindings fish_vi_key_bindings

set -gx LC_ALL en_US.UTF-8

set -gx GOPATH $HOME/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g

set -gx PATH /Users/ndyakov/Library/Python/3.7/bin $PATH

set -gx N_PREFIX $HOME/n
set -gx PATH $N_PREFIX/bin $PATH

# gpg tty
set -gx GPG_TTY (tty)
