set ls_binary (test (uname) = Darwin; and echo "gls"; or echo "ls")

alias ls "$ls_binary --color=auto --group-directories-first"
alias wget "wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
