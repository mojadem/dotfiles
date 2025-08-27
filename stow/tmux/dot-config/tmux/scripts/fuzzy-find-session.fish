set sessions (tmux ls -F '#{session_name}')
set repos (fd --type=directory --hidden --no-ignore --max-depth=4 --format='{//}' --glob .git $HOME/dev)

set fzf_input

for s in $sessions
    set active_session (tmux display-message -p '#{session_name}')
    test $s = $active_session; and continue
    set -a fzf_input "session:$s"
end

for r in $repos
    contains (basename $r) $sessions; and continue
    set r (string replace $HOME '~' $r)
    set -a fzf_input "repo:$r"
end

set selection (string join \n $fzf_input | fzf --tmux center)
test -z $selection; and exit

set selection (string split ':' $selection)
if test $selection[1] = 'session'
    tmux switch-client -t $selection[2]
else if test $selection[1] = 'repo'
    set dir (string replace '~' $HOME $selection[2])
    set session (basename $selection[2])
    set session (string replace --all '.' '' $session) # session names cannot contain '.'
    tmux new-session -d -c $dir -s $session
    tmux switch-client -t $session
end
