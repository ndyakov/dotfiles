# Dotfiles Configuration Guide

This dotfiles repository uses a template-based configuration system that allows you to customize colors, paths, and user-specific settings in one central location.

## Configuration File

All configuration variables are stored in `template-config.json` at the root of the repository.

### Location
```
~/personal/dotfiles/template-config.json
```

### ⚠️ Important: Privacy
**`template-config.json` is in `.gitignore` and should NEVER be committed to the repository** as it contains:
- Your email address
- Your GPG signing key
- Your home directory path
- Other personal information

Instead, use `template-config.json.example` as a template to create your own `template-config.json`.

## Configuration Variables

### User Information
| Variable | Description | Example |
|----------|-------------|---------|
| `HOME_DIR` | Your home directory path | `/Users/yourusername` |
| `USERNAME` | Your username | `yourusername` |
| `USER_NAME` | Your full name | `Your Full Name` |
| `USER_EMAIL` | Your email address | `your.email@example.com` |
| `SIGN_KEY` | GPG signing key | `YOUR_GPG_KEY_HERE` |
| `FONT` | Default font name | `JetBrains Mono` |

### Everforest Dark Color Palette

#### Background Colors
| Variable | Color | Description |
|----------|-------|-------------|
| `COLOR_BG` | `#232a2e` | Main background (custom medium) |
| `COLOR_BG_INACTIVE` | `#1e2326` | Inactive pane background |
| `COLOR_BG0` | `#272e33` | Background level 0 (hard) |
| `COLOR_BG1` | `#2e383c` | Background level 1 |
| `COLOR_BG2` | `#374145` | Background level 2 |
| `COLOR_BG3` | `#414b50` | Background level 3 |
| `COLOR_BG4` | `#495156` | Background level 4 |
| `COLOR_BG_DIM` | `#1e2326` | Dimmed background |
| `COLOR_BG_VISUAL` | `#4c3743` | Visual selection background |

#### Foreground Colors
| Variable | Color | Description |
|----------|-------|-------------|
| `COLOR_FG` | `#d3c6aa` | Main foreground text |

#### Accent Colors
| Variable | Color | Description |
|----------|-------|-------------|
| `COLOR_RED` | `#e67e80` | Red accent |
| `COLOR_ORANGE` | `#e69875` | Orange accent |
| `COLOR_YELLOW` | `#dbbc7f` | Yellow accent |
| `COLOR_GREEN` | `#a7c080` | Green accent |
| `COLOR_AQUA` | `#83c092` | Aqua accent |
| `COLOR_BLUE` | `#7fbbb3` | Blue accent |
| `COLOR_PURPLE` | `#d699b6` | Purple accent |

#### Grey Shades
| Variable | Color | Description |
|----------|-------|-------------|
| `COLOR_GREY0` | `#7a8478` | Grey shade 0 (darkest) |
| `COLOR_GREY1` | `#859289` | Grey shade 1 |
| `COLOR_GREY2` | `#9da9a0` | Grey shade 2 (lightest) |

#### Statusline Colors
| Variable | Color | Description |
|----------|-------|-------------|
| `COLOR_STATUSLINE1` | `#a7c080` | Statusline green |
| `COLOR_STATUSLINE2` | `#d3c6aa` | Statusline foreground |
| `COLOR_STATUSLINE3` | `#e67e80` | Statusline red |

### Sip.fish Prompt Colors

These variables configure the [sip.fish](https://github.com/ndyakov/sip.fish) prompt theme.

#### General Colors
| Variable | Color | Description |
|----------|-------|-------------|
| `SIP_COLOR_YELLOW` | `#dbbc7f` | Yellow color |
| `SIP_COLOR_CYAN` | `#83c092` | Cyan color |
| `SIP_COLOR_BLUE` | `#7fbbb3` | Blue color |
| `SIP_COLOR_GREEN` | `#a7c080` | Green color |
| `SIP_COLOR_RED` | `#e67e80` | Red color |
| `SIP_COLOR_WHITE` | `#d3c6aa` | White/foreground color |

#### Vi Mode Colors
| Variable | Color | Description |
|----------|-------|-------------|
| `SIP_COLOR_VI_INSERT_SUCCESS` | `#a7c080` | Insert mode (success) |
| `SIP_COLOR_VI_INSERT_ERROR` | `#e67e80` | Insert mode (error) |
| `SIP_COLOR_VI_NORMAL` | `#7fbbb3` | Normal mode |
| `SIP_COLOR_VI_VISUAL` | `#e67e80` | Visual mode |

#### Prompt Style
| Variable | Value | Description |
|----------|-------|-------------|
| `SIP_PROMPT_STYLE` | `default` | Prompt style (`default`, `short`, or custom) |

## Template Files

Template files use the `.template` extension and contain placeholders in the format `{{VARIABLE_NAME}}`.

### Current Template Files

1. **Fish Configuration**
   - `fish/ndyakov/conf.d/config.fish.template`
   - Contains: PATH settings, sip.fish colors

2. **Tmux Theme**
   - `tmux/plugins/tmux-everforest-dark/everforest-dark.conf.template`
   - Contains: All tmux color settings

3. **Neovim Configuration**
   - `nvim/lua/config/autocmds.lua.template`
   - Contains: Custom colorscheme overrides

## Initial Setup

### 1. Create Your Configuration File
Copy the example file and customize it with your personal information:

```bash
cp template-config.json.example template-config.json
nvim template-config.json
```

**Important:** Update these values with your own:
- `HOME_DIR` - Your home directory (e.g., `/Users/yourusername`)
- `USERNAME` - Your username
- `USER_EMAIL` - Your email address
- `USER_NAME` - Your full name
- `SIGN_KEY` - Your GPG signing key (if you use one)

The color values are already set to Everforest Dark and usually don't need to be changed.

## How to Use

### 1. Edit Configuration
Edit `template-config.json` to customize your settings:

```bash
nvim template-config.json
```

### 2. Process Templates
Run the template processor to generate configuration files from templates:

```bash
cd template-processor
go run main.go
```

This will:
- Read `template-config.json`
- Find all `.template` files
- Replace `{{VARIABLE_NAME}}` with actual values
- Generate the final configuration files

### 3. Apply Changes

#### Fish Shell
```bash
source ~/.config/fish/config.fish
```

#### Tmux
```bash
tmux source-file ~/.tmux.conf
# Or restart tmux completely
tmux kill-server && tmux
```

#### Neovim
Restart Neovim or run:
```vim
:source $MYVIMRC
```

## Adding New Templates

To create a new template:

1. **Create the template file** with `.template` extension:
   ```bash
   cp myconfig.conf myconfig.conf.template
   ```

2. **Replace hardcoded values** with template variables:
   ```bash
   # Before
   background_color = "#232a2e"
   
   # After
   background_color = "{{COLOR_BG}}"
   ```

3. **Add new variables** to `template-config.json` if needed:
   ```json
   {
     "variables": {
       "MY_NEW_VARIABLE": "value"
     }
   }
   ```

4. **Process templates** to generate the final file:
   ```bash
   cd template-processor && go run main.go
   ```

## Color Customization

To change the color scheme:

1. **Edit colors** in `template-config.json`
2. **Run template processor**
3. **Reload configurations** (fish, tmux, nvim)

### Example: Change to a Different Green

```json
{
  "variables": {
    "COLOR_GREEN": "#00ff00",
    "SIP_COLOR_GREEN": "#00ff00",
    "SIP_COLOR_VI_INSERT_SUCCESS": "#00ff00",
    "COLOR_STATUSLINE1": "#00ff00"
  }
}
```

## Path Customization

All paths use the `HOME_DIR` variable. To use these dotfiles on a different machine:

1. **Update `HOME_DIR`** in `template-config.json`:
   ```json
   {
     "variables": {
       "HOME_DIR": "/Users/newuser",
       "USERNAME": "newuser"
     }
   }
   ```

2. **Process templates**
3. **Run installation scripts**

## Files Using Templates

### Generated from Templates
- `fish/ndyakov/conf.d/config.fish` ← `config.fish.template`
- `tmux/plugins/tmux-everforest-dark/everforest-dark.conf` ← `everforest-dark.conf.template`
- `nvim/lua/config/autocmds.lua` ← `autocmds.lua.template`

### Direct Configuration (No Template)
- `template-config.json` - Central configuration file
- `palette.json` - Everforest color palette reference

## Troubleshooting

### Colors Not Updating
1. Make sure you ran the template processor
2. Reload the configuration (source files or restart applications)
3. Check that the template file exists and has correct variable names

### Template Processor Not Found
```bash
cd template-processor
go build
./template-processor
```

### Variables Not Replaced
- Check variable name matches exactly (case-sensitive)
- Ensure variable is defined in `template-config.json`
- Verify template uses `{{VARIABLE_NAME}}` format (double curly braces)

## Reference

- **Everforest Color Scheme**: https://github.com/sainnhe/everforest
- **Sip.fish Prompt**: https://github.com/ndyakov/sip.fish
- **Color Palette**: See `iterm/everforest/palette.json` for complete Everforest colors

