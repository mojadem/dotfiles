fish_vi_key_bindings

bind --mode insert ctrl-f 'commandline --insert (fd | fzf)'
bind --mode insert ctrl-alt-f 'commandline --insert (fd -IH | fzf)'
bind --mode insert ctrl-h 'commandline --insert (history | fzf)'
bind --mode insert ctrl-t tmux_sessionize
