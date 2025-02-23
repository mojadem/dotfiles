# env
export (envsubst < $HOME/.config/env/xdg.env)
export (envsubst < $HOME/.config/env/variables.env)

if test -e $HOME/.config/env/local.env
    export (envsubst < $HOME/.config/env/local.env)
end

set -x LS_COLORS (vivid generate gruvbox-dark)
set -x GPG_TTY (tty)
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# path
fish_add_path ~/.local/bin $CARGO_HOME/bin $GOPATH/bin $PIXI_HOME/bin $PNPM_HOME

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

bind --mode default yy fish_clipboard_copy
bind --mode insert \cN history-search-forward
bind --mode insert \cP history-search-backward
bind --mode insert \cA expand-abbr

bind --mode insert \cF tmux_create_session

# commands
alias ls "eza --icons --group-directories-first"
alias wget "wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

abbr root "cd (git rev-parse --show-toplevel)"
abbr lg lazygit

# plugins
if type -q fisher
    fzf_configure_bindings --directory=\e\cF --history=\e\cH --variables=\e\cV --processes=\e\cP --git_log=\e\cL --git_status=\e\cS
    set fzf_preview_dir_cmd eza --icons --oneline --group-directories-first --color=always
    set fzf_fd_opts --follow
    set -g hydro_color_pwd cyan
    set -g hydro_color_git brblack
    set -g hydro_color_prompt green
    set -g hydro_color_duration yellow
    set -g hydro_color_vi_mode_default white --bold
    set -g hydro_color_vi_mode_insert brblue --bold
    set -g hydro_color_vi_mode_replace brred --bold
    set -g hydro_color_vi_mode_visual fe8019 --bold
else
    echo 'fisher not installed, run `setup_plugins`'
end

# machine
if test -e $__fish_config_dir/local.fish
    source $__fish_config_dir/local.fish
end

# exit successfully
exit 0
