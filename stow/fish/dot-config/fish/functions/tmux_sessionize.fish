function tmux_sessionize
    set project_dirs (fd --type directory --hidden --format "{//}" --glob .git ~/dev)
    set project_dirs -a $project_dirs ~/proton/obsidian

    set selected (string replace $HOME '~' $project_dirs | fzf | string replace '~' $HOME)
    if test -z $selected
        return
    end

    # session names cannot contain '.'
    set session_name (basename $selected | string replace --all '.' '')

    if not tmux has-session -t $session_name &>/dev/null
        tmux new -d -c $selected -s $session_name
    end

    if test -z $TMUX
        tmux attach -t $session_name
    else
        tmux switch-client -t $session_name
    end

    commandline --function repaint
end
