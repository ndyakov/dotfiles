#!/usr/bin/make -f
# Dotfiles Makefile
# Manages installation and configuration of dotfiles

SHELL := /bin/bash
DOTFILES_DIR := $(shell pwd)
HOME_DIR := $(HOME)
CONFIG_DIR := $(HOME_DIR)/.config

# Colors for output
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

.PHONY: help
help: ## Show this help message
	@echo "$(BLUE)Dotfiles Management$(NC)"
	@echo ""
	@echo "$(GREEN)Available targets:$(NC)"
	@grep -E '^[a-zA-Z_.-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-20s$(NC) %s\n", $$1, $$2}'

.PHONY: all
all: deps install post-install ## Complete installation (deps + install + post-install)

.PHONY: deps
deps: homebrew brew-packages ## Install all dependencies

.PHONY: homebrew
homebrew: ## Install Homebrew if not present
	@echo "$(BLUE)Checking for Homebrew...$(NC)"
	@which brew > /dev/null || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@echo "$(GREEN)✓ Homebrew ready$(NC)"

.PHONY: brew-packages
brew-packages: ## Install packages from Homebrew
	@echo "$(BLUE)Installing Homebrew packages...$(NC)"
	@./brewery.sh
	@echo "$(GREEN)✓ Homebrew packages installed$(NC)"

.PHONY: install
install: git-config fish-setup vim-setup tmux-setup nvim-setup idea-setup ## Install all dotfiles configurations

.PHONY: git-config
git-config: ## Setup Git configuration
	@echo "$(BLUE)Setting up Git configuration...$(NC)"
	@ln -sf $(DOTFILES_DIR)/git/gitconfig $(HOME_DIR)/.gitconfig
	@echo "$(GREEN)✓ Git configuration linked$(NC)"

.PHONY: fish-setup
fish-setup: ## Setup Fish shell
	@echo "$(BLUE)Setting up Fish shell...$(NC)"
	@mkdir -p $(CONFIG_DIR)/fish
	@if ! grep -q "/opt/homebrew/bin/fish" /etc/shells 2>/dev/null; then \
		echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells; \
	fi
	@cp $(DOTFILES_DIR)/fish/fish_plugins $(CONFIG_DIR)/fish/fish_plugins
	@cp $(DOTFILES_DIR)/fish/fish_variables $(CONFIG_DIR)/fish/fish_variables
	@echo "$(DOTFILES_DIR)/fish/ndyakov" >> $(CONFIG_DIR)/fish/fish_plugins
	@if [ ! -f $(CONFIG_DIR)/fish/functions/fisher.fish ]; then \
		curl -sL https://git.io/fisher --create-dirs -o $(CONFIG_DIR)/fish/functions/fisher.fish; \
	fi
	@echo "$(GREEN)✓ Fish shell configured$(NC)"
	@echo "$(YELLOW)  Note: Run 'fisher update' in fish to install plugins$(NC)"

.PHONY: fish-shell
fish-shell: fish-setup ## Change default shell to Fish
	@echo "$(BLUE)Changing default shell to Fish...$(NC)"
	@chsh -s /opt/homebrew/bin/fish
	@echo "$(GREEN)✓ Default shell changed to Fish$(NC)"

.PHONY: vim-setup
vim-setup: ## Setup Vim configuration
	@echo "$(BLUE)Setting up Vim...$(NC)"
	@if [ ! -d "$(HOME_DIR)/.vim" ]; then \
		ln -sf $(DOTFILES_DIR)/vim $(HOME_DIR)/.vim; \
		ln -sf $(HOME_DIR)/.vim/vimrc $(HOME_DIR)/.vimrc; \
	fi
	@echo "$(GREEN)✓ Vim configured$(NC)"
	@echo "$(YELLOW)  Note: Run ':PlugInstall' in Vim to install plugins$(NC)"

.PHONY: tmux-setup
tmux-setup: ## Setup Tmux configuration
	@echo "$(BLUE)Setting up Tmux...$(NC)"
	@if [ ! -d "$(HOME_DIR)/.tmux" ]; then \
		ln -sf $(DOTFILES_DIR)/tmux $(HOME_DIR)/.tmux; \
		ln -sf $(HOME_DIR)/.tmux/tmux.conf $(HOME_DIR)/.tmux.conf; \
	fi
	@echo "$(GREEN)✓ Tmux configured$(NC)"
	@echo "$(YELLOW)  Note: Press prefix + I in tmux to install plugins$(NC)"

.PHONY: nvim-setup
nvim-setup: ## Setup Neovim configuration
	@echo "$(BLUE)Setting up Neovim...$(NC)"
	@mkdir -p $(CONFIG_DIR)
	@if [ ! -d "$(CONFIG_DIR)/nvim" ]; then \
		ln -sf $(DOTFILES_DIR)/nvim $(CONFIG_DIR)/nvim; \
	fi
	@echo "$(GREEN)✓ Neovim configured$(NC)"

.PHONY: nvim-deps
nvim-deps: ## Install Neovim dependencies (Python, Node, Ruby)
	@echo "$(BLUE)Installing Neovim dependencies...$(NC)"
	@command -v gem > /dev/null && gem install neovim || echo "$(YELLOW)Skipping Ruby neovim (gem not found)$(NC)"
	@command -v npm > /dev/null && npm install -g neovim || echo "$(YELLOW)Skipping Node neovim (npm not found)$(NC)"
	@command -v python3 > /dev/null && python3 -m pip install --user --upgrade pynvim || echo "$(YELLOW)Skipping Python neovim (python3 not found)$(NC)"
	@echo "$(GREEN)✓ Neovim dependencies installed$(NC)"

.PHONY: idea-setup
idea-setup: ## Setup IntelliJ IDEA vim configuration
	@echo "$(BLUE)Setting up IntelliJ IDEA vim configuration...$(NC)"
	@ln -sf $(DOTFILES_DIR)/idea/vimrc $(HOME_DIR)/.ideavimrc
	@echo "$(GREEN)✓ IntelliJ IDEA vim configuration linked$(NC)"

.PHONY: iterm-setup
iterm-setup: ## Setup iTerm2 color schemes (manual import required)
	@echo "$(BLUE)iTerm2 color schemes available at:$(NC)"
	@echo "  $(DOTFILES_DIR)/iterm/"
	@echo "$(YELLOW)  Import manually via iTerm2 → Preferences → Profiles → Colors$(NC)"

.PHONY: post-install
post-install: ## Install additional tools (Go, Node via version managers)
	@echo "$(BLUE)Running post-installation setup...$(NC)"
	@./post.sh
	@echo "$(GREEN)✓ Post-installation complete$(NC)"

.PHONY: secrets
secrets: ## Setup secrets (SSH keys, GPG keys)
	@echo "$(BLUE)Setting up secrets...$(NC)"
	@cd secrets && $(MAKE) install
	@echo "$(GREEN)✓ Secrets installed$(NC)"

.PHONY: update
update: update-repo update-submodules update-fish ## Update dotfiles repository and configurations

.PHONY: update-repo
update-repo: ## Pull latest changes from repository
	@echo "$(BLUE)Updating dotfiles repository...$(NC)"
	@git pull origin main || git pull origin master
	@echo "$(GREEN)✓ Repository updated$(NC)"

.PHONY: update-submodules
update-submodules: ## Update git submodules
	@echo "$(BLUE)Updating git submodules...$(NC)"
	@git submodule update --init --recursive
	@echo "$(GREEN)✓ Submodules updated$(NC)"

.PHONY: update-fish
update-fish: ## Update Fish shell configuration
	@echo "$(BLUE)Updating Fish configuration...$(NC)"
	@cp $(DOTFILES_DIR)/fish/fish_plugins $(CONFIG_DIR)/fish/fish_plugins
	@cp $(DOTFILES_DIR)/fish/fish_variables $(CONFIG_DIR)/fish/fish_variables
	@echo "$(GREEN)✓ Fish configuration updated$(NC)"
	@echo "$(YELLOW)  Note: Run 'fisher update' in fish to update plugins$(NC)"

.PHONY: clean
clean: ## Remove all symlinks and configurations (WARNING: destructive)
	@echo "$(RED)WARNING: This will remove all dotfile symlinks!$(NC)"
	@read -p "Are you sure? [y/N] " -n 1 -r; \
	echo; \
	if [[ $$REPLY =~ ^[Yy]$$ ]]; then \
		./clean.sh; \
		echo "$(GREEN)✓ Cleaned$(NC)"; \
	else \
		echo "$(YELLOW)Cancelled$(NC)"; \
	fi

.PHONY: backup
backup: ## Backup current configurations before installing
	@echo "$(BLUE)Backing up existing configurations...$(NC)"
	@mkdir -p $(HOME_DIR)/.dotfiles_backup
	@[ -f $(HOME_DIR)/.gitconfig ] && cp $(HOME_DIR)/.gitconfig $(HOME_DIR)/.dotfiles_backup/ || true
	@[ -f $(HOME_DIR)/.vimrc ] && cp $(HOME_DIR)/.vimrc $(HOME_DIR)/.dotfiles_backup/ || true
	@[ -f $(HOME_DIR)/.tmux.conf ] && cp $(HOME_DIR)/.tmux.conf $(HOME_DIR)/.dotfiles_backup/ || true
	@[ -f $(HOME_DIR)/.ideavimrc ] && cp $(HOME_DIR)/.ideavimrc $(HOME_DIR)/.dotfiles_backup/ || true
	@[ -d $(CONFIG_DIR)/fish ] && cp -r $(CONFIG_DIR)/fish $(HOME_DIR)/.dotfiles_backup/ || true
	@[ -d $(CONFIG_DIR)/nvim ] && cp -r $(CONFIG_DIR)/nvim $(HOME_DIR)/.dotfiles_backup/ || true
	@echo "$(GREEN)✓ Backup created at ~/.dotfiles_backup$(NC)"

.PHONY: test
test: ## Test that all configurations are properly linked
	@echo "$(BLUE)Testing dotfiles installation...$(NC)"
	@echo -n "Git config: "
	@[ -L $(HOME_DIR)/.gitconfig ] && echo "$(GREEN)✓$(NC)" || echo "$(RED)✗$(NC)"
	@echo -n "Vim config: "
	@[ -L $(HOME_DIR)/.vim ] && echo "$(GREEN)✓$(NC)" || echo "$(RED)✗$(NC)"
	@echo -n "Tmux config: "
	@[ -L $(HOME_DIR)/.tmux ] && echo "$(GREEN)✓$(NC)" || echo "$(RED)✗$(NC)"
	@echo -n "Neovim config: "
	@[ -L $(CONFIG_DIR)/nvim ] && echo "$(GREEN)✓$(NC)" || echo "$(RED)✗$(NC)"
	@echo -n "IDEA vim config: "
	@[ -L $(HOME_DIR)/.ideavimrc ] && echo "$(GREEN)✓$(NC)" || echo "$(RED)✗$(NC)"
	@echo -n "Fish config: "
	@[ -d $(CONFIG_DIR)/fish ] && echo "$(GREEN)✓$(NC)" || echo "$(RED)✗$(NC)"

.PHONY: list
list: ## List all managed dotfiles
	@echo "$(BLUE)Managed dotfiles:$(NC)"
	@echo "  • Git configuration (git/gitconfig)"
	@echo "  • Fish shell (fish/)"
	@echo "  • Vim (vim/)"
	@echo "  • Neovim (nvim/)"
	@echo "  • Tmux (tmux/)"
	@echo "  • IntelliJ IDEA vim (idea/vimrc)"
	@echo "  • iTerm2 themes (iterm/)"
	@echo "  • Secrets (secrets/)"

.DEFAULT_GOAL := help

