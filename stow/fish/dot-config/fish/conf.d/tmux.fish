if command -q tmux && status is-interactive && test -z $TMUX
    if tmux has-session -t default
        tmux attach-session -t default
    else
        tmux new-session -s default
    end
end
