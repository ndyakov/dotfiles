#!/bin/bash
# Sync IDEA configuration FROM dotfiles TO JetBrains IDE

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
IDEA_DIR="$DOTFILES_DIR/idea"

# Detect JetBrains IDE directory (GoLand, IntelliJ IDEA, etc.)
JETBRAINS_BASE="$HOME/Library/Application Support/JetBrains"

# Find the most recent IDE version
IDE_CONFIG_DIR=$(find "$JETBRAINS_BASE" -maxdepth 1 -type d -name "GoLand*" -o -name "IntelliJIdea*" | sort -r | head -1)

if [ -z "$IDE_CONFIG_DIR" ]; then
    echo "❌ No JetBrains IDE configuration found in $JETBRAINS_BASE"
    exit 1
fi

echo "📦 Syncing from: $IDEA_DIR"
echo "📁 To: $IDE_CONFIG_DIR"
echo ""

# Create directories
mkdir -p "$IDE_CONFIG_DIR/colors"
mkdir -p "$IDE_CONFIG_DIR/options"

# Sync color schemes
if [ -d "$IDEA_DIR" ]; then
    echo "🎨 Syncing color schemes..."
    cp -v "$IDEA_DIR/"*.icls "$IDE_CONFIG_DIR/colors/" 2>/dev/null || echo "  No color schemes found"
fi

# Sync options
if [ -d "$IDEA_DIR/options" ]; then
    echo "⚙️  Syncing options..."
    cp -v "$IDEA_DIR/options/"*.xml "$IDE_CONFIG_DIR/options/" 2>/dev/null || echo "  No options found"
fi

# IdeaVim config
if [ ! -f "$HOME/.ideavimrc" ]; then
    echo "🔗 Creating IdeaVim symlink..."
    ln -sf "$IDEA_DIR/vimrc" "$HOME/.ideavimrc"
    echo "  ✅ Symlinked ~/.ideavimrc -> $IDEA_DIR/vimrc"
else
    echo "✅ IdeaVim symlink already exists"
fi

echo ""
echo "✅ Sync complete!"
echo ""
echo "⚠️  Please restart your JetBrains IDE for changes to take effect."

