set -x SESSION_CMD 'tmux ls -F "#{session_name}" | rg -v $(tmux display-message -p "#{session_name}")'
set -x REPO_CMD 'fd -HI -t=d -d=3 --format={//} -g .git $HOME/dev | sed "s|$HOME|~|"'

set selection (begin
	eval $SESSION_CMD | fzf \
		--tmux center,border-native \
		--prompt='sessions> ' \
		--header='fuzzy-find-session: ctrl-s for sessions, ctrl-r for repos' \
		--bind 'ctrl-s:reload(eval $SESSION_CMD)+change-prompt(sessions> )' \
		--bind 'ctrl-r:reload(eval $REPO_CMD)+change-prompt(repos> )' \
		| sed "s|~|$HOME|"
end)
test -z "$selection" && exit

set session (basename $selection)
if not tmux ls -F '#{session_name}' | rg -Fxq $session
    set session (tmux new-session -d -c $selection -s $session -P -F '#{session_name}')
end

tmux switch-client -t $session
