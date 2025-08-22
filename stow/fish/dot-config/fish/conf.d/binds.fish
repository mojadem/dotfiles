bind ctrl-f 'commandline --insert (fd | fzf)'
bind ctrl-alt-f 'commandline --insert (fd -IH | fzf)'
bind ctrl-h 'commandline --insert (history | fzf)'
bind ctrl-t tmux_sessionize
