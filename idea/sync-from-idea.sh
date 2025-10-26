#!/bin/bash
# Sync IDEA configuration FROM JetBrains IDE TO dotfiles

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

echo "📦 Syncing from: $IDE_CONFIG_DIR"
echo "📁 To: $IDEA_DIR"
echo ""

# Create directories
mkdir -p "$IDEA_DIR/options"
mkdir -p "$IDEA_DIR/colors"

# Sync color schemes
if [ -d "$IDE_CONFIG_DIR/colors" ]; then
    echo "🎨 Syncing color schemes..."
    cp -v "$IDE_CONFIG_DIR/colors/"*.icls "$IDEA_DIR/" 2>/dev/null || echo "  No color schemes found"
fi

# Sync important options
echo "⚙️  Syncing options..."
OPTIONS=(
    "colors.scheme.xml"
    "ui.lnf.xml"
    "editor.xml"
    "editor-font.xml"
)

for option in "${OPTIONS[@]}"; do
    if [ -f "$IDE_CONFIG_DIR/options/$option" ]; then
        cp -v "$IDE_CONFIG_DIR/options/$option" "$IDEA_DIR/options/"
    else
        echo "  ⚠️  $option not found"
    fi
done

# IdeaVim config is already symlinked, so no need to copy
echo ""
echo "✅ Sync complete!"
echo ""
echo "📝 Don't forget to commit the changes:"
echo "   cd $DOTFILES_DIR"
echo "   git add idea/"
echo "   git commit -m 'Update IDEA configuration'"

