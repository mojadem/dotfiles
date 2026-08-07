set ls_binary (command -q gls; and echo "gls"; or echo "ls")
alias ls "$ls_binary --color=auto --group-directories-first"

function _init_aliases --on-event init_done
    alias wget "wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

    functions --erase _init_aliases
end
