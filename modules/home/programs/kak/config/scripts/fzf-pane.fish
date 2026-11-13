set original $TMUX_PANE
set picker (tmux new-window -dEP -F '#{pane_id}' -c "$PWD")
set tmp (mktemp -d)

function cleanup --on-event fish_exit
    tmux swap-pane -s "$original" -t "$picker"
    tmux kill-pane -t "$picker"
    rm -rf "$tmp"
end

cat >"$tmp/input"

tmux swap-pane -s "$picker" -t "$original"
tmux respawn-pane -t "$picker" fish -N -c '
    set tmp $argv[1]
    set -e argv[1]

    fzf $argv < "$tmp/input" > "$tmp/output"
    tmux wait-for -S "$tmp/done"

    # Keep the pane alive until cleanup kills it.
    sleep 67
' "$tmp" $argv

tmux wait-for "$tmp/done"
cat "$tmp/output"
