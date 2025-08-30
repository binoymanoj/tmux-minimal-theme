#!/usr/bin/env bash

# Catppuccin Mocha (default)
catppuccin_mocha() {
    tmux set-option -g @minimal_theme_bg_color "#1A1D23"
    tmux set-option -g @minimal_theme_active_color "#b4befe"
    tmux set-option -g @minimal_theme_inactive_color "#6c7086"
    tmux set-option -g @minimal_theme_text_color "#cdd6f4"
    tmux set-option -g @minimal_theme_accent_color "#b4befe"
    tmux set-option -g @minimal_theme_border_color "#44475a"
}

# Tokyo Night
tokyo_night() {
    tmux set-option -g @minimal_theme_bg_color "#1a1b26"
    tmux set-option -g @minimal_theme_active_color "#7aa2f7"
    tmux set-option -g @minimal_theme_inactive_color "#565f89"
    tmux set-option -g @minimal_theme_text_color "#c0caf5"
    tmux set-option -g @minimal_theme_accent_color "#7aa2f7"
    tmux set-option -g @minimal_theme_border_color "#414868"
}

# Dracula
dracula() {
    tmux set-option -g @minimal_theme_bg_color "#282a36"
    tmux set-option -g @minimal_theme_active_color "#bd93f9"
    tmux set-option -g @minimal_theme_inactive_color "#6272a4"
    tmux set-option -g @minimal_theme_text_color "#f8f8f2"
    tmux set-option -g @minimal_theme_accent_color "#bd93f9"
    tmux set-option -g @minimal_theme_border_color "#44475a"
}

# Gruvbox Dark
gruvbox_dark() {
    tmux set-option -g @minimal_theme_bg_color "#1d2021"
    tmux set-option -g @minimal_theme_active_color "#83a598"
    tmux set-option -g @minimal_theme_inactive_color "#665c54"
    tmux set-option -g @minimal_theme_text_color "#ebdbb2"
    tmux set-option -g @minimal_theme_accent_color "#83a598"
    tmux set-option -g @minimal_theme_border_color "#504945"
}
