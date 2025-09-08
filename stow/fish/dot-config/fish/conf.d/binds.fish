bind ctrl-f 'commandline --insert (fd | fzf)'
bind ctrl-alt-f 'commandline --insert (fd -IH | fzf)'
bind ctrl-r 'commandline --replace (history | fzf --scheme=history --query=(commandline))'
