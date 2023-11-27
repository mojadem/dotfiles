eval (/opt/homebrew/bin/brew shellenv)

export (envsubst < $HOME/.dotfiles/variables.env)

alias ls="eza --icons --oneline --group-directories-first"
alias la="ls -a"
alias ll="ls -al"

abbr --add gitst git status
abbr --add gita. git add .
abbr --add gitcm git commit -m
abbr --add gitcam git commit -am
