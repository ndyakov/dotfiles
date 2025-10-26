# vi bindings
set -u vi_mode_default vi_mode_normal
set -u fish_key_bindings fish_vi_key_bindings

set -gx LC_ALL en_US.UTF-8

set -gx GOPATH /Users/ndyakov/go; set -gx GOROOT /Users/ndyakov/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g

set -gx PATH /Users/ndyakov/Library/Python/3.7/bin $PATH

set -gx N_PREFIX /Users/ndyakov/n
set -gx PATH $N_PREFIX/bin $PATH

# gpg tty
set -gx GPG_TTY (tty)

# Sip.fish color configuration (Everforest Dark theme)
# General Colors
set -g sip_color_yellow #dbbc7f
set -g sip_color_cyan #83c092
set -g sip_color_blue #7fbbb3
set -g sip_color_green #a7c080
set -g sip_color_red #e67e80
set -g sip_color_white #d3c6aa

# Vi Mode Colors
set -g sip_color_vi_insert_success #a7c080
set -g sip_color_vi_insert_error #e67e80
set -g sip_color_vi_normal #7fbbb3
set -g sip_color_vi_visual #e67e80

# Prompt Style
set -g sip_prompt_style "default"
