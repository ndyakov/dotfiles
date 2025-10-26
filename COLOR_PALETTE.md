# Everforest Dark Medium Color Palette

This document describes the color palette used across all dotfiles configurations.

## Quick Reference

All colors can be previewed at [ColorHexa](https://www.colorhexa.com/) by clicking the links below.

## Foreground Colors

| Variable | Hex Code | Preview | Usage |
|----------|----------|---------|-------|
| `COLOR_FG` | `#d3c6aa` | [🎨 View](https://www.colorhexa.com/d3c6aa) | Main foreground text color |
| `COLOR_WHITE` | `#f2efdf` | [🎨 View](https://www.colorhexa.com/f2efdf) | Bright white text, highlights |

## Background Colors

Listed from darkest to lightest:

| Variable | Hex Code | Preview | Usage |
|----------|----------|---------|-------|
| `COLOR_BG_INACTIVE` | `#1e2326` | [🎨 View](https://www.colorhexa.com/1e2326) | Inactive pane/window background |
| `COLOR_BG_NORMAL` | `#20262a` | [🎨 View](https://www.colorhexa.com/20262a) | Normal editor background |
| `COLOR_BG_ACTIVE` | `#232a2e` | [🎨 View](https://www.colorhexa.com/232a2e) | Active pane/window background (lightest) |

## Accent Colors

### Yellow
| Variable | Hex Code | Preview | Usage |
|----------|----------|---------|-------|
| `COLOR_YELLOW` | `#dbbc7f` | [🎨 View](https://www.colorhexa.com/dbbc7f) | Yellow accent, warnings, modified files |

### Cyan
| Variable | Hex Code | Preview | Usage |
|----------|----------|---------|-------|
| `COLOR_CYAN` | `#83c092` | [🎨 View](https://www.colorhexa.com/83c092) | Cyan accent, commands, strings |

### Blue
| Variable | Hex Code | Preview | Usage |
|----------|----------|---------|-------|
| `COLOR_BLUE` | `#7fbbb3` | [🎨 View](https://www.colorhexa.com/7fbbb3) | Blue accent, keywords |
| `COLOR_BLUE_BRIGHT` | `#0fbbb3` | [🎨 View](https://www.colorhexa.com/0fbbb3) | Bright blue, insert mode indicator |

### Green
| Variable | Hex Code | Preview | Usage |
|----------|----------|---------|-------|
| `COLOR_GREEN` | `#a7c080` | [🎨 View](https://www.colorhexa.com/a7c080) | Green accent, success, clean git status |
| `COLOR_GREEN_DARK` | `#91a161` | [🎨 View](https://www.colorhexa.com/91a161) | Dark green, normal mode indicator |

### Red
| Variable | Hex Code | Preview | Usage |
|----------|----------|---------|-------|
| `COLOR_RED` | `#e67e80` | [🎨 View](https://www.colorhexa.com/e67e80) | Red accent, errors, dirty git status, visual mode |

## Usage in Configurations

### Fish Prompt (sip.fish)
- Uses all accent colors for git status, paths, and mode indicators
- Green for clean git status
- Red for dirty git status
- Blue for normal mode
- Bright blue for insert mode

### Tmux (tmux/tmux.conf)
- COLOR_BG_INACTIVE - Inactive pane background
- COLOR_BG_ACTIVE - Active pane background

### Neovim (nvim/lua/)
- COLOR_BG_NORMAL - Editor background
- COLOR_BG_INACTIVE - Inactive window background
- COLOR_FG - Text color
- COLOR_BLUE_BRIGHT - Lualine insert mode
- COLOR_GREEN_DARK - Lualine normal mode

### IdeaVim (idea/vimrc)
- COLOR_CYAN - Which-key command color
- COLOR_RED - Which-key prefix color

### LSD (lsd/colors.yaml)
- Uses all accent colors for file types and permissions
- Green for readable files
- Yellow for writable files
- Red for executable files

## Customization

To customize colors:

1. Edit template-config.json (or copy from template-config.json.example)
2. Update the color values
3. Run the template processor: cd template-processor && go run main.go
4. Restart your applications to see the changes

## Color Scheme Source

This palette is based on the [Everforest](https://github.com/sainnhe/everforest) color scheme by sainnhe, specifically the "Dark Medium" variant.

## Testing Colors

You can test color combinations using these tools:
- [ColorHexa](https://www.colorhexa.com/) - Color information and conversions
- [Contrast Checker](https://webaim.org/resources/contrastchecker/) - Accessibility testing
- [Coolors](https://coolors.co/) - Color palette generator
