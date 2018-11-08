set fish_plugins autojump vi-mode
set vi_mode_default vi_mode_normal

function fish_user_key_bindings
  fish_vi_key_bindings
end

set -gx GOPATH $HOME/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g
