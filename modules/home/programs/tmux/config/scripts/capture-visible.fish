# Print the currently visible pane contents (respects copy-mode scroll)
tmux display -p '#{?scroll_position,#{scroll_position},0} #{pane_height}' | read pos height
tmux capture-pane -p -S -$pos -E (math $height - 1 - $pos)
