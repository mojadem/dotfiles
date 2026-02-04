bind ctrl-f 'commandline --insert (fd | fzf -m | string join " ")'
bind ctrl-alt-f 'commandline --insert (fd -IH | fzf -m | string join " ")'
bind ctrl-r 'commandline --replace (history | fzf --scheme=history --query=(commandline))'
bind ctrl-alt-r 'commandline --insert (history | fzf --scheme=history)'
bind ctrl-y accept-autosuggestion
