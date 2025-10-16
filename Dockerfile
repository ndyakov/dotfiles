# Dockerfile for testing dotfiles installation
# Note: This uses Ubuntu as macOS cannot run in Docker
# This simulates the installation process for testing purposes

FROM ubuntu:22.04

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color

# Install basic dependencies and all tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    sudo \
    locales \
    ca-certificates \
    fish \
    vim \
    neovim \
    tmux \
    tig \
    ripgrep \
    fzf \
    direnv \
    silversearcher-ag \
    gnupg \
    htop \
    python3 \
    python3-pip \
    nodejs \
    npm \
    ruby \
    ruby-dev \
    make \
    && rm -rf /var/lib/apt/lists/*

# Set up locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Create a non-root user for testing
RUN useradd -m -s /bin/bash testuser && \
    echo "testuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to test user
USER testuser
WORKDIR /home/testuser

# Set up environment
ENV HOME=/home/testuser

# Copy dotfiles into the container
COPY --chown=testuser:testuser . /home/testuser/dotfiles

WORKDIR /home/testuser/dotfiles

# Create a test script
RUN echo '#!/bin/bash\n\
echo "================================="\n\
echo "Dotfiles Test Environment"\n\
echo "================================="\n\
echo ""\n\
echo "This is a Linux-based test environment."\n\
echo "macOS-specific features (Homebrew paths, etc.) will not work."\n\
echo ""\n\
echo "Available commands:"\n\
echo "  make help     - Show all available targets"\n\
echo "  make list     - List managed dotfiles"\n\
echo "  make test     - Test installation status"\n\
echo ""\n\
echo "To test individual components:"\n\
echo "  make git-config   - Setup Git configuration"\n\
echo "  make vim-setup    - Setup Vim"\n\
echo "  make tmux-setup   - Setup Tmux"\n\
echo "  make nvim-setup   - Setup Neovim"\n\
echo ""\n\
echo "Note: Full installation (make all) will fail due to macOS dependencies."\n\
echo ""\n\
exec /bin/bash' > /home/testuser/test-env.sh && chmod +x /home/testuser/test-env.sh

CMD ["/home/testuser/test-env.sh"]

