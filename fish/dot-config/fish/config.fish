# env
export (envsubst < $HOME/.config/env/xdg.env)
export (envsubst < $HOME/.config/env/variables.env)

if test -e $HOME/.config/env/local.env
    export (envsubst < $HOME/.config/env/local.env)
end

# path
fish_add_path -g $CARGO_HOME/bin $GOPATH/bin $PNPM_HOME
# fish
fish_vi_key_bindings
set fish_greeting

set fish_vi_force_cursor
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_external line
set fish_cursor_visual block

bind --mode insert -k nul accept-autosuggestion
bind --mode default yy fish_clipboard_copy
bind --mode insert \cN history-search-forward
bind --mode insert \cP history-search-backward
bind --mode insert \cA expand-abbr

# commands
alias ls "eza --icons --group-directories-first"

abbr root "cd (git rev-parse --show-toplevel)"
abbr lg lazygit
abbr py python3
abbr pip pip3
abbr wgit "wget https://raw.githubusercontent.com/"

# plugins
if type -q fisher
    fzf_configure_bindings --directory=\cf --history=\ch --variables=\ce --processes= --git_log= --git_status=
    set fzf_preview_dir_cmd eza --icons --oneline --group-directories-first --color=always
    set fzf_fd_opts --follow
else
    echo 'fisher not installed, run setup_fisher'
end

# machine
if test -e $__fish_config_dir/local.fish
    source $__fish_config_dir/local.fish
end
