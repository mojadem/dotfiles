set sessions (tmux ls -F '#{session_name}')
set repos (fd --type=directory --hidden --no-ignore --max-depth=4 --format='{//}' --glob .git $HOME/dev)

set fzf_input

for s in $sessions
    # Only filter out active session if we are in TMUX
    if set -q TMUX
        set active_session (tmux display-message -p '#{session_name}')
        test $s = $active_session; and continue
    end
    set -a fzf_input "session:$s"
end

for r in $repos
    contains (basename $r) $sessions; and continue
    set r (string replace $HOME '~' $r)
    set -a fzf_input "repo:$r"
end

set selection (string join \n $fzf_input | fzf --tmux center,border-native)
test -z $selection; and exit

set selection (string split ':' $selection)
set session

if test $selection[1] = session
    set session $selection[2]
else if test $selection[1] = repo
    set dir (string replace '~' $HOME $selection[2])
    # Session names cannot contain '.'
    set session (basename $selection[2] | string replace --all '.' '' $session)
    tmux new-session -d -c $dir -s $session
end

if set -q TMUX
    tmux switch-client -t $session
else
    tmux attach -t $session
end
