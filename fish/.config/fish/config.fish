eval (/opt/homebrew/bin/brew shellenv)

export (envsubst < $HOME/.dotfiles/variables.env)

alias ls="eza --icons --oneline --group-directories-first"
alias la="ls -a"
alias ll="ls -al"

abbr --add gitst git status
abbr --add gita. git add .
abbr --add gitcm git commit -m
abbr --add gitcam git commit -am

set -gx PNPM_HOME "/Users/mojadem/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

starship init fish | source
