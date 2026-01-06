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

# gruvbox colors
set -x GRUVBOX_BLACK 282828
set -x GRUVBOX_RED cc241d
set -x GRUVBOX_GREEN 98971a
set -x GRUVBOX_YELLOW d79921
set -x GRUVBOX_BLUE 458588
set -x GRUVBOX_PURPLE b16286
set -x GRUVBOX_AQUA 689d6a
set -x GRUVBOX_WHITE a89984
set -x GRUVBOX_BRBLACK 928374
set -x GRUVBOX_BRRED fb4934
set -x GRUVBOX_BRGREEN b8bb26
set -x GRUVBOX_BRYELLOW fabd2f
set -x GRUVBOX_BRBLUE 83a598
set -x GRUVBOX_BRPURPLE d3869b
set -x GRUVBOX_BRAQUA 8ec07c
set -x GRUVBOX_BRWHITE ebdbb2
set -x GRUVBOX_ORANGE d65d0e
set -x GRUVBOX_BRORANGE fe8019
set -x GRUVBOX_BG_H 1d2021
set -x GRUVBOX_BG_S 32302f
set -x GRUVBOX_BG $GRUVBOX_BLACK
set -x GRUVBOX_FG $GRUVBOX_BRWHITE

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
