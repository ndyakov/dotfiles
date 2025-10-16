# Quick Start Guide

## 🚀 Installation (5 minutes)

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Backup existing configs (optional but recommended)
make backup

# 3. Install everything
make all

# 4. Change shell to Fish (optional)
make fish-shell
# Then restart your terminal
```

## 📋 Common Commands

```bash
# Show all available commands
make help

# Install specific components
make git-config      # Git only
make fish-setup      # Fish shell only
make vim-setup       # Vim only
make nvim-setup      # Neovim only
make tmux-setup      # Tmux only

# Update dotfiles
make update

# Test installation
make test

# List managed files
make list
```

## 🔧 Post-Installation

### Fish Shell
```bash
fish
fisher update
```

### Vim
```bash
vim
:PlugInstall
```

### Neovim
```bash
make nvim-deps
nvim
:PlugInstall
```

### Tmux
```bash
tmux
# Press Ctrl+b then Shift+I
```

## 🎨 Customization

### Update Git Config
Edit `git/gitconfig`:
```ini
[user]
    name = Your Name
    email = your.email@example.com
```

Then run:
```bash
make git-config
```

### Add Fish Aliases
Edit `fish/ndyakov/conf.d/aliases.fish` and add your aliases.

### iTerm2 Themes
1. Open iTerm2 → Preferences → Profiles → Colors
2. Click "Color Presets" → "Import"
3. Select from `~/dotfiles/iterm/`

## 🧪 Testing

```bash
# Test in Docker (safe, isolated)
./test-docker.sh

# Or manually
docker build -t dotfiles-test .
docker run -it --rm dotfiles-test
```

## 🆘 Troubleshooting

```bash
# Homebrew not found
make homebrew

# Symlinks already exist
make backup
rm ~/.gitconfig ~/.vimrc ~/.tmux.conf
make install

# Verify everything is linked
make test
```

## 📚 More Information

- [README.md](README.md) - Full documentation
- [INSTALL.md](INSTALL.md) - Detailed installation guide
- [TESTING.md](TESTING.md) - Testing procedures
- [SUMMARY.md](SUMMARY.md) - Complete overview

## ⚡ One-Liners

```bash
# Fresh install
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles && cd ~/dotfiles && make all

# Update everything
cd ~/dotfiles && make update

# Reinstall from scratch
cd ~/dotfiles && make clean && make all

# Test without installing
cd ~/dotfiles && ./test-docker.sh
```

---

**Need help?** Run `make help` or check the [README.md](README.md)

