#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing tmux-minimal-theme..."

# Make scripts executable
chmod +x "$CURRENT_DIR/../minimal.tmux"
chmod +x "$CURRENT_DIR/minimal-theme.sh"

echo "✅ tmux-minimal-theme installed successfully!"
echo ""
echo "Add the following to your tmux.conf:"
echo "set -g @plugin 'binoymanoj/tmux-minimal-theme'"
echo ""
echo "Then reload tmux config or restart tmux."
