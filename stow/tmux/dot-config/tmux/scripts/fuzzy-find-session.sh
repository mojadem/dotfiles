export SESSION_CMD='tmux ls -F "#{session_name}" | rg -vx $(tmux display-message -p "#{session_name}")'
export REPO_CMD='fd -HI -t=d -d=3 --format={//} -g .git $HOME/dev | sed "s|$HOME|~|"'

selection=$(
	eval $SESSION_CMD | fzf \
		--tmux center,border-native \
		--prompt='sessions> ' \
		--header='fuzzy-find-session: ctrl-s for sessions, ctrl-r for repos' \
		--bind 'ctrl-s:reload(eval $SESSION_CMD)+change-prompt(sessions> )' \
		--bind 'ctrl-r:reload(eval $REPO_CMD)+change-prompt(repos> )' |
		sed "s|~|$HOME|"
)
[ -z "$selection" ] && exit

case "$selection" in
/*)
	session=$(basename $(dirname $selection))/$(basename $selection)

	if ! tmux ls -F '#{session_name}' | rg -Fxq $session; then
		session=$(tmux new-session -d -c $selection -s $session -P -F '#{session_name}')
	fi
	;;
*)
	session=$selection
	;;
esac

tmux switch-client -t $session
