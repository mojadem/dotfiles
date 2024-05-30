switch (uname)
    case Darwin
        eval (/opt/homebrew/bin/brew shellenv)
end

export (envsubst < $HOME/.config/env/xdg.env)
export (envsubst < $HOME/.config/env/variables.env)

fish_add_path -g $CARGO_HOME/bin $GOPATH/bin

if status is-interactive
    alias ls "eza --icons --oneline --group-directories-first"
    alias lt "ls --tree"
    alias la "ls -a"
    alias ll "ls -al --git"
end

abbr cdgit "cd (git rev-parse --show-toplevel)"
abbr lg lazygit
abbr py python3

fzf_configure_bindings --directory=\cf --history=\ch --variables=\ce --processes= --git_log= --git_status=
set fzf_preview_dir_cmd eza --icons --oneline --group-directories-first --color=always
set fzf_fd_opts --follow

bind --mode insert -k nul accept-autosuggestion

