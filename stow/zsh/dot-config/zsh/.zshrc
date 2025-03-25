export $(envsubst < $HOME/.config/env/xdg.env)
export $(envsubst < $HOME/.config/env/variables.env)

autoload -Uz compinit
compinit

export HISTFILE=$XDG_STATE_HOME/zsh/history
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
