if test (uname) = Darwin
    eval (/opt/homebrew/bin/brew shellenv)
end

export (sh ~/.config/env/env.sh)

type -q vivid && set -x LS_COLORS (vivid generate gruvbox-dark)

set -g fish_greeting
