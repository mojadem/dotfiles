set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state

# xdg fixes
set -x DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x GOPATH $XDG_DATA_HOME/go
set -x HELIX_RUNTIME $XDG_DATA_HOME/helix/runtime
set -x PNPM_HOME $XDG_DATA_HOME/pnpm
set -x PIXI_HOME $XDG_DATA_HOME/pixi
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history
set -x IPFS_PATH $XDG_DATA_HOME/ipfs

# misc
set -x EDITOR kak
set -x GPG_TTY (tty)
set -q UNAME || set -x UNAME (uname)
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

set -x FZF_DEFAULT_OPTS "\
	--cycle \
	--layout=reverse \
	--style=minimal \
	--color=bg:black,fg:white,hl:green,bg+:#$GRUVBOX_BG_S,fg+:bright-white,hl+:green,prompt:cyan,input-fg:bright-white,pointer:white,marker:white"

status is-interactive && type -q vivid && set -x LS_COLORS (vivid generate gruvbox-dark)

# path
fish_add_path ~/.local/bin
fish_add_path $CARGO_HOME/bin
fish_add_path $GOPATH/bin
fish_add_path $PIXI_HOME/bin
fish_add_path $PNPM_HOME
