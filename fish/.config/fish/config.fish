switch (uname)
    case Darwin
        eval (/opt/homebrew/bin/brew shellenv)
    case Linux
        alias bat="batcat"
end

export (envsubst < $HOME/.dotfiles/xdg.env)
export (envsubst < $HOME/.dotfiles/variables.env)

fish_add_path -g $PNPM_HOME $CARGO_HOME/bin

alias ls="eza --icons --oneline --group-directories-first"
alias la="ls -a"
alias ll="ls -al --git"

abbr gitst git status
abbr gita. git add .
abbr gitcm git commit -m
abbr gitcam git commit -am
abbr gitco git checkout

set fzf_fd_opts --hidden
set fzf_preview_dir_cmd eza --icons --oneline --group-directories-first --color=always --all 

starship init fish | source
enable_transience
