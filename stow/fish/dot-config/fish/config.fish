abbr e $EDITOR
abbr lg lazygit
abbr oc opencode
abbr root "cd (git rev-parse --show-toplevel)"

set ls_binary (command -q gls; and echo "gls"; or echo "ls")
alias ls "$ls_binary --color=auto --group-directories-first"

alias wget "wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

bind ctrl-f 'commandline --insert (fd | fzf -m | string join " ")'
bind ctrl-alt-f 'commandline --insert (fd -IH | fzf -m | string join " ")'
bind ctrl-r 'commandline --replace (history | fzf --scheme=history --query=(commandline))'
bind ctrl-y accept-autosuggestion

set fish_color_command brcyan
set fish_color_comment brblack
set fish_color_operator brblue
set fish_color_param cyan
set fish_color_quote green

set -g fish_greeting
set -g fish_key_bindings fish_default_key_bindings

emit init_done
