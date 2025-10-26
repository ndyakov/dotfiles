# Everforest Dark for tmux

> A dark theme for [tmux](https://github.com/tmux/tmux/wiki) based on the Everforest color palette

![Everforest Dark](screenshot.png)

## Features

- Matches Neovim lualine Everforest theme
- True color (24-bit) support
- Green highlights for active elements
- Based on Everforest hard background variant
- Custom darker background matching Neovim configuration

## Colors

The theme uses the following Everforest Dark colors:

| Element | Color | Everforest Name |
|---------|-------|-----------------|
| **Status bar background** | `#2e383c` | bg1 (hard) |
| **Status bar foreground** | `#d3c6aa` | fg |
| **Active elements** | `#a7c080` | green (statusline1) |
| **Inactive text** | `#859289` | grey1 |
| **Pane borders** | `#495156` | bg4 |
| **Blue accents** | `#7fbbb3` | blue |

## Install

### Using TPM (Tmux Plugin Manager)

1. Add plugin to your `~/.tmux.conf`:

```bash
set -g @plugin 'ndyakov/tmux-everforest-dark'
```

2. Press `prefix + I` to fetch and source the plugin

### Manual Installation

1. Clone this repository:

```bash
git clone https://github.com/ndyakov/tmux-everforest-dark ~/.tmux/plugins/tmux-everforest-dark
```

2. Source the theme in your `~/.tmux.conf`:

```bash
run-shell ~/.tmux/plugins/tmux-everforest-dark/everforest-dark.tmux
```

3. Reload tmux configuration:

```bash
tmux source-file ~/.tmux.conf
```

## Configuration

The theme is designed to work out of the box with sensible defaults matching the Neovim lualine Everforest theme.

### Statusbar Layout

```
┌─────────────────────────────────────────────────────────────────┐
│ SESSION │ window1  [window2]  window3 │ 2024-10-26  14:30  host │
└─────────────────────────────────────────────────────────────────┘
   Green      Inactive  Active              Grey    Medium  Green
```

- **Left**: Session name with green background (like lualine mode indicator)
- **Center**: Window list with active window highlighted in green
- **Right**: Date, time, and hostname

## Compatibility

- macOS
- Linux
- Requires tmux 2.9 or higher for true color support

## License

[MIT License](LICENSE)

## Credits

- Based on the [Everforest](https://github.com/sainnhe/everforest) color scheme by sainnhe
- Inspired by [Dracula for tmux](https://github.com/dracula/tmux)

