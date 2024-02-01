switch (uname)
    case Darwin
        eval (/opt/homebrew/bin/brew shellenv)
	    abbr cdsem cd /Users/mojadem/Library/CloudStorage/OneDrive-ThePennsylvaniaStateUniversity/PSU/sem8
    case Linux
        alias bat="batcat"
end

export (envsubst < $HOME/.config/env/xdg.env)
export (envsubst < $HOME/.config/env/variables.env)

fish_add_path -g $PNPM_HOME $CARGO_HOME/bin $GOPATH/bin

alias ls="eza --icons --oneline --group-directories-first"
alias lt="ls -T"
alias la="ls -a"
alias ll="ls -al --git"

abbr lg lazygit
abbr r refresh

fzf_configure_bindings --directory=\cf --history=\ch --variables=\ce --git_log= --git_status= --processes=
set fzf_preview_dir_cmd eza --icons --oneline --group-directories-first --color=always
set fzf_fd_opts --follow

bind --mode insert -k nul accept-autosuggestion

starship init fish | source
enable_transience
