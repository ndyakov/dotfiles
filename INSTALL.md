# Installation Guide

This guide provides detailed installation instructions for setting up these dotfiles on a new macOS system.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Fresh Installation](#fresh-installation)
- [Selective Installation](#selective-installation)
- [Post-Installation Steps](#post-installation-steps)
- [Verification](#verification)
- [Troubleshooting](#troubleshooting)

## Prerequisites

### System Requirements

- macOS (tested on Apple Silicon, should work on Intel Macs)
- Administrator access (for installing Homebrew and changing shell)
- Internet connection
- Git (usually pre-installed on macOS)

### Before You Begin

1. **Backup your existing configurations:**
   ```bash
   # The Makefile can do this for you
   make backup
   
   # Or manually backup important files
   cp ~/.gitconfig ~/.gitconfig.backup
   cp ~/.vimrc ~/.vimrc.backup
   cp ~/.tmux.conf ~/.tmux.conf.backup
   ```

2. **Check for existing configurations:**
   ```bash
   ls -la ~ | grep -E '\.vim|\.tmux|\.gitconfig|\.ideavimrc'
   ls -la ~/.config | grep -E 'fish|nvim'
   ```

## Fresh Installation

### Step 1: Clone the Repository

```bash
# Clone to your home directory
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Initialize and update submodules
git submodule update --init --recursive
```

### Step 2: Run Complete Installation

```bash
# This will install everything
make all
```

This command will:
1. Install Homebrew (if not present)
2. Install all required packages
3. Setup all configuration files
4. Install additional tools (Go, Node version managers)

### Step 3: Change Default Shell (Optional)

```bash
make fish-shell
```

**Note:** You'll need to restart your terminal after this step.

### Step 4: Install Plugin Managers

After the main installation, you need to install plugins for each tool:

**Fish Shell:**
```bash
# Open Fish shell
fish

# Update Fisher plugins
fisher update
```

**Vim:**
```bash
# Open Vim
vim

# Inside Vim, run:
:PlugInstall
```

**Neovim:**
```bash
# Install Neovim dependencies first
make nvim-deps

# Open Neovim
nvim

# Inside Neovim, run:
:PlugInstall
```

**Tmux:**
```bash
# Start tmux
tmux

# Press prefix + I (default: Ctrl+b then Shift+i)
# This will install TPM plugins
```

## Selective Installation

If you only want specific configurations, use individual targets:

### Git Only
```bash
make git-config
```

### Fish Shell Only
```bash
make deps              # Install Homebrew and packages
make fish-setup        # Setup Fish configuration
make fish-shell        # Change default shell (optional)
```

### Vim Only
```bash
make deps              # Install Homebrew and packages
make vim-setup         # Setup Vim
# Then open Vim and run :PlugInstall
```

### Neovim Only
```bash
make deps              # Install Homebrew and packages
make nvim-setup        # Setup Neovim
make nvim-deps         # Install Neovim dependencies
# Then open Neovim and run :PlugInstall
```

### Tmux Only
```bash
make deps              # Install Homebrew and packages
make tmux-setup        # Setup Tmux
# Then start tmux and press prefix + I
```

### IntelliJ IDEA Vim Only
```bash
make idea-setup
```

## Post-Installation Steps

### 1. Configure Git User Information

Edit `~/dotfiles/git/gitconfig` and update:
```ini
[user]
    name = Your Name
    email = your.email@example.com
    signingkey = YOUR_GPG_KEY_ID  # Optional
```

Then relink:
```bash
make git-config
```

### 2. Setup Secrets (Optional)

If you have encrypted secrets:

1. Create vault password file:
   ```bash
   echo "your-vault-password" > ~/.drunk
   chmod 600 ~/.drunk
   ```

2. Install secrets:
   ```bash
   make secrets
   ```

### 3. Import iTerm2 Color Schemes

1. Open iTerm2
2. Go to **Preferences** → **Profiles** → **Colors**
3. Click **Color Presets** → **Import**
4. Navigate to `~/dotfiles/iterm/`
5. Select and import your preferred color scheme

### 4. Configure Fish Shell

After installing Fish, you may want to:

```bash
# Set Fish as default shell
make fish-shell

# Restart terminal, then update plugins
fisher update

# Configure Fish interactively
fish_config
```

### 5. Install Additional Language Tools

The `post.sh` script installs version managers for Go and Node:

```bash
# This is run automatically with 'make all'
# Or run manually:
./post.sh

# After installation:
# For Go: g install latest
# For Node: n latest
```

## Verification

### Test Installation

```bash
make test
```

This will check if all symlinks are properly created.

### Manual Verification

```bash
# Check Git config
ls -la ~/.gitconfig

# Check Vim
ls -la ~/.vim ~/.vimrc

# Check Tmux
ls -la ~/.tmux ~/.tmux.conf

# Check Neovim
ls -la ~/.config/nvim

# Check Fish
ls -la ~/.config/fish

# Check IDEA vim
ls -la ~/.ideavimrc

# Verify shell
echo $SHELL
```

### Test Each Tool

```bash
# Test Git
git config --list

# Test Vim
vim --version

# Test Neovim
nvim --version

# Test Tmux
tmux -V

# Test Fish
fish --version
```

## Troubleshooting

### Homebrew Installation Fails

If Homebrew installation fails:
```bash
# Install manually
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add to PATH (for Apple Silicon)
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Then retry
make brew-packages
```

### Fish Shell Not Found

```bash
# Check if Fish is installed
which fish

# If not found, install manually
brew install fish

# Add to /etc/shells
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells

# Change shell
chsh -s /opt/homebrew/bin/fish
```

### Symlink Already Exists

If you get errors about existing files:

```bash
# Backup and remove existing files
mv ~/.gitconfig ~/.gitconfig.backup
mv ~/.vimrc ~/.vimrc.backup
mv ~/.tmux.conf ~/.tmux.conf.backup

# Then retry installation
make install
```

### Permission Denied

Some operations require sudo:
```bash
# Changing shell
sudo chsh -s /opt/homebrew/bin/fish $USER

# Adding Fish to /etc/shells
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
```

### Vim/Neovim Plugins Not Installing

```bash
# For Vim - install vim-plug manually
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# For Neovim - install vim-plug manually
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Then open Vim/Neovim and run :PlugInstall
```

### Tmux Plugins Not Installing

```bash
# Install TPM manually
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Start tmux and press prefix + I
```

## Updating

To update your dotfiles after initial installation:

```bash
cd ~/dotfiles
make update
```

This will:
- Pull latest changes from the repository
- Update git submodules
- Update Fish configuration

## Uninstalling

To remove all dotfiles:

```bash
cd ~/dotfiles
make clean
```

**Warning:** This will remove all symlinks. Your original files in `~/.dotfiles_backup/` will remain intact.

## Next Steps

After installation:

1. Customize configurations to your preferences
2. Add your own aliases and functions to Fish
3. Install additional Vim/Neovim plugins
4. Configure your Git signing key for commit signing
5. Set up your development environment

## Getting Help

- Run `make help` to see all available commands
- Check the main [README.md](README.md) for more information
- Review individual configuration files for customization options

