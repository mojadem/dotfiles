switch (tmux display-message -p '#S')
    case default
        tmux switch-client -l
    case '*'
        if not tmux has-session -t default
            tmux new-session -d -c ~ -s default
        end

        tmux switch-client -t default
end
