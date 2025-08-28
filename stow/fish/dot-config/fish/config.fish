set -g fish_greeting
set -g fish_key_bindings fish_default_key_bindings

# enter tmux automatically
if command -q tmux && status is-interactive && test -z $TMUX
    if tmux has-session -t default
        exec tmux attach-session -t default
    else
        exec tmux new-session -s default
    end
end
