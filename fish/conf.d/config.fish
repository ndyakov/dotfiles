# vi bindings
set -u fish_plugins autojump vi-mode
set -u vi_mode_default vi_mode_normal
set -u fish_key_bindings fish_vi_key_bindings

set -gx GOPATH $HOME/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g

set -gx PATH /Users/ndyakov/Library/Python/3.7/bin $PATH

set -gx N_PREFIX $HOME/n;
set -gx PATH $N_PREFIX/bin $PATH;

## some generated stuff
SET FZF_DEFAULT_OPTS:\x2d\x2dheight\x2040\x25
SET FZF_LEGACY_KEYBINDINGS:1
SET FZF_PREVIEW_DIR_CMD:ls
SET FZF_PREVIEW_FILE_CMD:head\x20\x2dn\x2010
SET FZF_TMUX_HEIGHT:40\x25
SET ZO_CMD:zo
SET Z_CMD:z
SET Z_DATA:/Users/ndyakov/\x2elocal/share/z/data
SET Z_DATA_DIR:/Users/ndyakov/\x2elocal/share/z
SET Z_EXCLUDE:/Users/ndyakov
SET __fish_classic_git_prompt_initialized:\x1d
SET __fish_init_2_39_8:\x1d
SET __fish_init_2_3_0:\x1d
SET fish_color_autosuggestion:9C9C9C
SET fish_color_cancel:\x2dr
SET fish_color_command:F4F4F4
SET fish_color_comment:B0B0B0
SET fish_color_cwd:green
SET fish_color_cwd_root:red
SET fish_color_end:969696
SET fish_color_error:FFA779
SET fish_color_escape:bryellow\x1e\x2d\x2dbold
SET fish_color_history_current:\x2d\x2dbold
SET fish_color_host:normal
SET fish_color_match:\x2d\x2dbackground\x3dbrblue
SET fish_color_normal:normal
SET fish_color_operator:bryellow
SET fish_color_param:A0A0F0
SET fish_color_quote:666A80
SET fish_color_redirection:FAFAFA
SET fish_color_search_match:bryellow\x1e\x2d\x2dbackground\x3dbrblack
SET fish_color_selection:white\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3dbrblack
SET fish_color_status:red
SET fish_color_user:brgreen
SET fish_color_valid_path:\x2d\x2dunderline
SET fish_greeting:Welcome\x20to\x20fish\x2c\x20the\x20friendly\x20interactive\x20shell
SET fish_key_bindings:fish_vi_key_bindings
SET fish_pager_color_completion:\x1d
SET fish_pager_color_description:B3A06D\x1eyellow
SET fish_pager_color_prefix:white\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
SET fish_pager_color_progress:brwhite\x1e\x2d\x2dbackground\x3dcyan
