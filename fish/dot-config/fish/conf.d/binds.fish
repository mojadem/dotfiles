fish_vi_key_bindings

bind --mode insert ctrl-f 'commandline --insert (fd | fzf)'
bind --mode insert ctrl-f 'commandline --insert (fd -IH | fzf)'
bind --mode insert ctrl-alt-f tmux_sessionize
