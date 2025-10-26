#!/usr/bin/env bash
# Everforest Dark theme for tmux
# Based on Everforest color palette
# Matches Neovim lualine style

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source the theme
tmux source-file "$CURRENT_DIR/everforest-dark.conf"

