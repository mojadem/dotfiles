function tmux --wraps tmux
    if test (count $argv) -ne 0
        command tmux $argv
        return
    end

    if command tmux has-session -t default
        command tmux attach-session -t default
    else
        command tmux new-session -s default
    end
end
