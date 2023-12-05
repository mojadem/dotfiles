switch (uname)
    case Darwin
        eval (/opt/homebrew/bin/brew shellenv)
end


export (envsubst < $HOME/.dotfiles/xdg.env)
export (envsubst < $HOME/.dotfiles/variables.env)

alias ls="eza --icons --oneline --group-directories-first"
alias la="ls -a"
alias ll="ls -al --git"

abbr --add gitst git status
abbr --add gita. git add .
abbr --add gitcm git commit -m
abbr --add gitcam git commit -am
abbr --add gitco git checkout

set fzf_fd_opts --hidden
set fzf_preview_dir_cmd eza --icons --oneline --group-directories-first --color=always --all 

starship init fish | source
enable_transience
