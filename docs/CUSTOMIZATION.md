# Advanced Customization Guide

## Status Bar Segments

### Left Status Bar

The left status bar shows the session name with an icon. You can customize it by overriding the tmux option:

```bash
# Custom left status
tmux set-option -g status-left "#[fg=your-color,bold] 🚀 #S #[fg=separator-color]│ "
```

### Right Status Bar

The right status bar contains multiple segments. You can modify individual segments:

```bash
# Custom right status without battery
set -g status-right "\
#[fg=$accent_color] #[fg=$text_color]#(basename #{pane_current_path}) \
#[fg=$inactive_color]│ \
#[fg=$accent_color] #[fg=$text_color]#(free | awk '/^Mem/ { printf(\"%.0f%%\", \$3/\$2 * 100) }' ) \
#[fg=$inactive_color]│ \
#[fg=$accent_color] #[fg=$text_color]#(date +%H:%M) "
```

### Custom Icons

You can replace the default icons:

```bash
# Session icon
set -g @minimal_theme_session_icon " "

# Directory icon  
set -g @minimal_theme_dir_icon " "

# Memory icon
set -g @minimal_theme_memory_icon " "

# Clock icon
set -g @minimal_theme_clock_icon " "

# Battery icon
set -g @minimal_theme_battery_icon " "
```

### Window Status Customization

```bash
# Custom window status format
set -g window-status-format "#[fg=$inactive_color] #I #W "
set -g window-status-current-format "#[fg=$active_color,bold] #I #W "

# Add window flags
set -g window-status-format "#[fg=$inactive_color] #I:#W#F "
set -g window-status-current-format "#[fg=$active_color,bold] #I:#W#F "
```

### Pane Styling

```bash
# Custom pane border colors
set -g pane-border-style "fg=#your-border-color"
set -g pane-active-border-style "fg=#your-active-color,bold"

# Display pane numbers
set -g display-panes-colour "#your-inactive-color"
set -g display-panes-active-colour "#your-active-color"
```
