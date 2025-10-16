# Testing Guide

This document explains how to test the dotfiles installation using Docker.

## Overview

Since macOS cannot run in Docker, we use an Ubuntu-based container to test the installation scripts and Makefile targets. This provides a safe, isolated environment to verify that the dotfiles setup works correctly.

## Prerequisites

- Docker installed and running
- Docker Compose (optional, but recommended)

## Quick Test

### Using the Test Script

The easiest way to test is using the provided script:

```bash
./test-docker.sh
```

This will:
1. Build the Docker image
2. Start an interactive container
3. Drop you into a bash shell where you can test commands

### Manual Docker Build

```bash
# Build the image
docker build -t dotfiles-test .

# Run interactively
docker run -it --rm dotfiles-test
```

### Using Docker Compose

```bash
# Build and run
docker-compose run --rm dotfiles-test

# Or just build
docker-compose build
```

## Testing Individual Components

Once inside the container, you can test individual components:

### Test Git Configuration

```bash
make git-config
git config --list
```

### Test Vim Setup

```bash
make vim-setup
ls -la ~/.vim ~/.vimrc
```

### Test Tmux Setup

```bash
make tmux-setup
ls -la ~/.tmux ~/.tmux.conf
```

### Test Neovim Setup

```bash
make nvim-setup
ls -la ~/.config/nvim
```

### Test Fish Setup

```bash
make fish-setup
ls -la ~/.config/fish
```

### Test IDEA Vim Setup

```bash
make idea-setup
ls -la ~/.ideavimrc
```

### Run All Tests

```bash
make test
```

This will check if all symlinks are properly created.

## Automated Testing

You can run automated tests without entering the container:

```bash
# Test help command
docker run --rm dotfiles-test bash -c "make help"

# Test git configuration
docker run --rm dotfiles-test bash -c "make git-config && make test"

# Test all individual setups
docker run --rm dotfiles-test bash -c "
  make git-config && \
  make vim-setup && \
  make tmux-setup && \
  make nvim-setup && \
  make idea-setup && \
  make test
"
```

## Expected Results

### Successful Git Config Test

```
✓ Git configuration linked
Git config: ✓
```

### Successful Vim Setup Test

```
✓ Vim configured
Vim config: ✓
```

### Successful Tmux Setup Test

```
✓ Tmux configured
Tmux config: ✓
```

## Limitations

The Docker test environment has some limitations:

1. **No macOS-specific features**: Homebrew paths, macOS-specific tools won't work
2. **No GUI applications**: iTerm2 color schemes can't be tested
3. **Limited shell testing**: Changing default shell requires logout/login
4. **No secrets**: Encrypted secrets testing requires vault password

## What Gets Tested

✅ **Working in Docker:**
- Makefile syntax and targets
- Symlink creation
- File copying
- Directory structure
- Git configuration
- Vim/Neovim configuration
- Tmux configuration
- Fish configuration files
- IDEA vim configuration

❌ **Not Working in Docker:**
- Homebrew installation (macOS-specific paths)
- Changing default shell (requires session restart)
- iTerm2 themes (GUI application)
- macOS-specific tools (pinentry-mac, etc.)
- Secrets installation (requires vault password)

## Continuous Testing

You can set up a simple test loop:

```bash
# Watch for changes and rebuild
while true; do
  docker build -t dotfiles-test . && \
  docker run --rm dotfiles-test bash -c "make test"
  sleep 5
done
```

## Cleaning Up

Remove the test image when done:

```bash
# Remove image
docker rmi dotfiles-test

# Remove all stopped containers
docker container prune

# Remove all unused images
docker image prune
```

## Troubleshooting

### Build Fails

If the Docker build fails:

```bash
# Clean build cache
docker builder prune

# Rebuild without cache
docker build --no-cache -t dotfiles-test .
```

### Container Won't Start

```bash
# Check Docker is running
docker ps

# Check image exists
docker images | grep dotfiles-test

# View logs
docker logs <container-id>
```

### Permission Issues

The container runs as `testuser` (non-root) to simulate a real user environment. If you need root access:

```bash
docker run -it --rm --user root dotfiles-test bash
```

## Advanced Testing

### Test with Volume Mount

To test changes without rebuilding:

```bash
docker run -it --rm \
  -v $(pwd):/home/testuser/dotfiles:ro \
  dotfiles-test bash
```

### Test Specific Makefile Target

```bash
docker run --rm dotfiles-test bash -c "make <target>"
```

### Interactive Debugging

```bash
# Start container with bash
docker run -it --rm dotfiles-test bash

# Inside container, run commands manually
cd /home/testuser/dotfiles
make help
make git-config
ls -la ~/
```

## CI/CD Integration

Example GitHub Actions workflow:

```yaml
name: Test Dotfiles

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Build Docker image
        run: docker build -t dotfiles-test .
      
      - name: Test Makefile
        run: docker run --rm dotfiles-test bash -c "make help"
      
      - name: Test installations
        run: |
          docker run --rm dotfiles-test bash -c "
            make git-config && \
            make vim-setup && \
            make tmux-setup && \
            make nvim-setup && \
            make test
          "
```

## Summary

The Docker testing environment provides a safe way to:
- Verify Makefile targets work correctly
- Test symlink creation
- Validate file structure
- Ensure scripts run without errors
- Test on a clean system

While it can't test macOS-specific features, it catches most common issues and validates the core installation logic.

