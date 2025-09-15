if [ "$(uname -s)" = "Darwin" ]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi


echo "$(envsubst < $HOME/.config/env/xdg.env)
$(envsubst < $HOME/.config/env/xdg-patches.env)
$(envsubst < $HOME/.config/env/config.env)
$(envsubst < $HOME/.config/env/path.env)
GPG_TTY=$(tty)
"

