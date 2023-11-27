eval (/opt/homebrew/bin/brew shellenv)

export (envsubst < $HOME/.dotfiles/variables.env)

alias ls="eza --icons --oneline"
alias la="ls -a"
