function tmux_create_session
    set project_dirs (fd --type directory . ~/dev | string replace -r '/$' '' | while read d; test -e $d/.git && echo $d; end)
    set -a project_dirs ~/.dotfiles

    set selected (string replace $HOME '~' $project_dirs | fzf | string replace '~' $HOME)
    if test -z $selected
        return
    end

    set session_name (basename $selected | string replace -r '^\.' '')

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
