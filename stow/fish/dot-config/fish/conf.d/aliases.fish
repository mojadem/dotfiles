set ls_binary (test (uname) = Darwin; and echo "gls"; or echo "ls")

alias ls "$ls_binary --color=auto --group-directories-first"
alias wget "wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

alias copy (test (uname) = Darwin; and echo 'pbcopy'; or echo 'wl-copy')
alias paste (test (uname) = Darwin; and echo 'pbpaste'; or echo 'wl-paste')
