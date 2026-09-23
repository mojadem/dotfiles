function email
    if tmux has-session -t email
        tmux attach-session -t email
    else
        tmux new-session -s email 'fish -ic aerc'
    end
end
