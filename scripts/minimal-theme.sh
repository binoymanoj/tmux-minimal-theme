#!/usr/bin/env bash

get_tmux_option() {
    local option="$1"
    local default_value="$2"
    local option_value="$(tmux show-option -gqv "$option")"
    if [ -z "$option_value" ]; then
        echo "$default_value"
    else
        echo "$option_value"
    fi
}

apply_minimal_theme() {
    # Get theme colors (allow customization)
    local bg_color=$(get_tmux_option "@minimal_theme_bg_color" "#1A1D23")
    local active_color=$(get_tmux_option "@minimal_theme_active_color" "#b4befe")
    local inactive_color=$(get_tmux_option "@minimal_theme_inactive_color" "#6c7086")
    local text_color=$(get_tmux_option "@minimal_theme_text_color" "#cdd6f4")
    local accent_color=$(get_tmux_option "@minimal_theme_accent_color" "#b4befe")
    local border_color=$(get_tmux_option "@minimal_theme_border_color" "#44475a")
    local icon_session=$(get_tmux_option "@minimal_theme_session_icon" "")
    local icon_dir=$(get_tmux_option "@minimal_theme_dir_icon" "")
    local icon_memory=$(get_tmux_option "@minimal_theme_memory_icon" "")
    local icon_date=$(get_tmux_option "@minimal_theme_date_icon" "")
    local icon_clock=$(get_tmux_option "@minimal_theme_clock_icon" "")
    local icon_battery=$(get_tmux_option "@minimal_theme_battery_icon" "")

    # Status bar setup
    tmux set-option -g status on
    tmux set-option -g status-position bottom
    tmux set-option -g status-interval 3
    tmux set-option -g status-justify left

    # Status bar colors and style
    tmux set-option -g status-style "bg=$bg_color,fg=$text_color"
    tmux set-option -g status-left-length 100
    tmux set-option -g status-right-length 100

    # Pane borders
    tmux set-option -g pane-border-style "fg=$border_color"
    tmux set-option -g pane-active-border-style "fg=$active_color"

    # Message style
    tmux set-option -g message-style "bg=$bg_color,fg=$text_color,bold"
    tmux set-option -g message-command-style "bg=$bg_color,fg=$text_color,bold"

    # Window status format
    tmux set-option -g window-status-format "#[fg=$inactive_color,bg=$bg_color] #I:#W "
    tmux set-option -g window-status-current-format "#[fg=$active_color,bg=$bg_color,bold] #I:#W "
    tmux set-option -g window-status-separator ""

    # Status left (session name)
    tmux set-option -g status-left "#[fg=$accent_color,bold]$icon_session  #S #[fg=$inactive_color]│ "

    # Status right with system info
    local status_right="\
#[fg=$accent_color]$icon_dir #[fg=$text_color]#([ #{pane_current_path} = \$HOME ] && echo '~' || basename #{pane_current_path}) \
#[fg=$inactive_color]│ \
#[fg=$accent_color]$icon_memory #[fg=$text_color]#(free | awk '/^Mem/ { printf(\"%.0f%%\", \$3/\$2 * 100 - 0.5) }' ) \
#[fg=$inactive_color]│ \
#[fg=$accent_color]$icon_date #[fg=$text_color]#(date +%d) \
#[fg=$inactive_color]│ \
#[fg=$accent_color]$icon_clock #[fg=$text_color]#(date +%H:%M) \
#[fg=$inactive_color]│ \
#[fg=$accent_color]$icon_battery #[fg=$text_color]#(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null || echo 'N/A')% "

    tmux set-option -g status-right "$status_right"

    # Copy mode styling
    tmux set-option -g mode-style "bg=$active_color,fg=$bg_color"

    # Clock mode
    tmux set-option -g clock-mode-colour "$active_color"
    tmux set-option -g clock-mode-style 24
}
