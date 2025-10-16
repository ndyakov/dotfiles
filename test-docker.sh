#!/bin/bash
# Script to test dotfiles installation in Docker

set -e

echo "🐳 Building Docker test environment..."
docker build -t dotfiles-test .

echo ""
echo "✅ Docker image built successfully!"
echo ""
echo "To run the test environment:"
echo "  docker run -it --rm dotfiles-test"
echo ""
echo "Or use docker-compose:"
echo "  docker-compose run --rm dotfiles-test"
echo ""
echo "Inside the container, you can test:"
echo "  make help       - See all available commands"
echo "  make list       - List managed dotfiles"
echo "  make git-config - Test Git configuration"
echo "  make vim-setup  - Test Vim setup"
echo "  make tmux-setup - Test Tmux setup"
echo ""
echo "Starting interactive session..."
echo ""

docker run -it --rm dotfiles-test

