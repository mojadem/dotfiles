set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state

set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -x GOPATH $XDG_DATA_HOME/go
set -x IPFS_PATH $XDG_DATA_HOME/ipfs
set -x PNPM_HOME $XDG_DATA_HOME/pnpm
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history

set -x EDITOR kak
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

set -x FZF_DEFAULT_OPTS "\
	--cycle \
	--layout=reverse \
	--style=minimal \
	--color=bg:black,fg:white,hl:green,bg+:#32302f,fg+:bright-white,hl+:green,prompt:cyan,input-fg:bright-white,pointer:white,marker:white"

status is-interactive && set -x GPG_TTY (tty)
status is-interactive && type -q vivid && set -x LS_COLORS (vivid generate gruvbox-dark)
