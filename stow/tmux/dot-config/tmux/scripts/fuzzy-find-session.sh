#!/usr/bin/env bash

export SESSION_CMD='tmux ls -F "#{session_name}" | rg -vx $(tmux display-message -p "#{session_name}")'
export REPO_CMD='fd -HI -t=d -d=3 --format={//} -g .git $HOME/dev | sed "s|$HOME|~|"'

toggle_mode() {
	if [ "$(cat $1)" = 'sessions' ]; then
		echo 'repos' >$1
		echo 'reload(eval $REPO_CMD)+change-prompt(repos> )'
	else
		echo 'sessions' >$1
		echo 'reload(eval $SESSION_CMD)+change-prompt(sessions> )'
	fi
}
export -f toggle_mode

state_file=$(mktemp)
echo "sessions" >$state_file
trap "rm -f $state_file" EXIT

selection=$(
	eval $SESSION_CMD | fzf \
		--tmux center,border-native \
		--prompt='sessions> ' \
		--header='tab to toggle sessions/repos' \
		--bind="tab:transform(toggle_mode $state_file)" \
		--with-shell='bash -c' |
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
