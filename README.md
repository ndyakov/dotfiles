# 🔧 dotfiles

Personal dotfiles for macOS development environment. Includes configurations for Fish shell, Vim, Neovim, Tmux, Git, and IntelliJ IDEA.

## 📦 What's Included

- **Fish Shell** - Modern shell with custom functions and aliases
- **Vim/Neovim** - Comprehensive editor configuration with plugins
- **Tmux** - Terminal multiplexer configuration
- **Git** - Git configuration with useful aliases
- **IntelliJ IDEA** - IdeaVim configuration
- **iTerm2** - Color schemes (Everforest and custom themes)
- **Secrets Management** - Encrypted SSH keys and GPG keys using Ansible Vault

## 🚀 Quick Start

### Prerequisites

- macOS (tested on Apple Silicon)
- Git
- Internet connection

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Backup existing configurations (recommended):**
   ```bash
   make backup
   ```

3. **Install everything:**
   ```bash
   make all
   ```

   Or install step by step:
   ```bash
   make deps      # Install Homebrew and packages
   make install   # Setup all configurations
   make post-install  # Install additional tools
   ```

4. **Change default shell to Fish (optional):**
   ```bash
   make fish-shell
   ```

## 📋 Makefile Targets

Run `make help` to see all available targets:

### Main Targets

- `make all` - Complete installation (deps + install + post-install)
- `make deps` - Install Homebrew and all packages
- `make install` - Install all dotfile configurations
- `make help` - Show all available targets

### Individual Component Setup

- `make git-config` - Setup Git configuration
- `make fish-setup` - Setup Fish shell
- `make vim-setup` - Setup Vim
- `make nvim-setup` - Setup Neovim
- `make nvim-deps` - Install Neovim dependencies (Python, Node, Ruby)
- `make tmux-setup` - Setup Tmux
- `make idea-setup` - Setup IntelliJ IDEA vim configuration
- `make iterm-setup` - Show iTerm2 color scheme location

### Maintenance

- `make update` - Update repository and configurations
- `make backup` - Backup existing configurations
- `make test` - Test that all configurations are properly linked
- `make clean` - Remove all symlinks (destructive!)
- `make list` - List all managed dotfiles

### Secrets

- `make secrets` - Install encrypted secrets (requires vault password)

## 📦 Installed Packages

The following packages are installed via Homebrew (see `brewery.sh`):

**Development Tools:**
- git, fish, nvim, vim, tmux
- direnv, fzf, tig, rg (ripgrep)
- the_silver_searcher, diff-so-fancy

**System Utilities:**
- wget, watch, nmap, coreutils
- htop, iftop, cmatrix
- reattach-to-user-namespace

**Security:**
- gnupg, pinentry-mac

**Other:**
- php, tmuxinator, asciinema, highlight

## 🐚 Fish Shell

### Features

- Custom functions and aliases (see `fish/ndyakov/`)
- Fisher plugin manager
- Custom prompt and theme
- Git integration

### Post-Installation

After installation, open Fish and run:
```fish
fisher update
```

## 📝 Vim/Neovim

### Features

- Plugin management with vim-plug
- Custom key bindings
- Language support and syntax highlighting
- CoC (Conquer of Completion) for Neovim

### Post-Installation

**For Vim:**
Open Vim and run `:PlugInstall`

**For Neovim:**
1. Install language dependencies: `make nvim-deps`
2. Open Neovim and run `:PlugInstall`

## 🖥️ Tmux

### Features

- Custom key bindings
- Plugin support via TPM (Tmux Plugin Manager)
- Status bar customization

### Post-Installation

1. Start tmux: `tmux`
2. Install plugins: Press `prefix + I` (default prefix is `Ctrl+b`)

## 🔐 Secrets Management

Sensitive files (SSH keys, GPG keys) are encrypted using Ansible Vault.

### Setup

1. Create vault password file: `~/.drunk`
2. Install secrets: `make secrets`

See `secrets/README.md` for more details.

## 🎨 iTerm2 Themes

Color schemes are available in the `iterm/` directory:
- `after.itermcolors`
- `everforest/` - Everforest theme variants

**To import:**
1. Open iTerm2
2. Go to Preferences → Profiles → Colors
3. Click "Color Presets" → "Import"
4. Select a `.itermcolors` file from `~/dotfiles/iterm/`

## 🔄 Updating

To update your dotfiles:

```bash
cd ~/dotfiles
make update
```

This will:
- Pull latest changes from the repository
- Update git submodules
- Update Fish configuration

## 🧹 Uninstalling

To remove all dotfile symlinks:

```bash
make clean
```

**Warning:** This is destructive and will remove all symlinks created by this repository.

## 📁 Directory Structure

```
.
├── Makefile           # Main installation and management script
├── README.md          # This file
├── brewery.sh         # Homebrew package installation
├── clean.sh           # Cleanup script
├── init.sh            # Legacy installation script
├── post.sh            # Post-installation script
├── fish/              # Fish shell configuration
│   ├── fish_plugins
│   ├── fish_variables
│   └── ndyakov/       # Custom functions and aliases
├── git/               # Git configuration
│   └── gitconfig
├── idea/              # IntelliJ IDEA configuration
│   └── vimrc
├── iterm/             # iTerm2 color schemes
├── nvim/              # Neovim configuration
│   ├── init.vim
│   └── coc-settings.json
├── secrets/           # Encrypted secrets
│   └── Makefile
├── tmux/              # Tmux configuration
│   └── tmux.conf
└── vim/               # Vim configuration
    └── vimrc
```

## 🤝 Contributing

Feel free to fork and customize for your own use!

## 📄 License

You can take what you want. 🤫

## 💡 Tips

1. **First Time Setup:** Run `make backup` before installation to save your existing configs
2. **Selective Installation:** Use individual targets like `make vim-setup` if you only want specific tools
3. **Testing:** Run `make test` to verify all symlinks are correctly created
4. **Shell Change:** Remember to restart your terminal after running `make fish-shell`

## 🐛 Troubleshooting

### Fish shell not found
Make sure Homebrew is installed and `/opt/homebrew/bin` is in your PATH.

### Vim/Neovim plugins not working
Run `:PlugInstall` inside Vim/Neovim after installation.

### Tmux plugins not loading
Press `prefix + I` inside tmux to install plugins.

### Permission denied errors
Some operations (like changing shell) require sudo access. Make sure you have admin privileges.

---

**Note:** This dotfiles repository is configured for macOS with Apple Silicon. Paths may need adjustment for Intel Macs or other operating systems.
