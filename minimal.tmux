#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source the theme file
source "$CURRENT_DIR/scripts/minimal-theme.sh"

# Apply the theme
apply_minimal_theme
