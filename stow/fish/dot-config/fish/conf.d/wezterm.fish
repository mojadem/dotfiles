if not set -q TERM_PROGRAM; or test $TERM_PROGRAM != WezTerm
    exit
end

function __wezterm_set_user_var
    command -q base64 || return
    printf "\033]1337;SetUserVar=%s=%s\007" "$argv[1]" (echo -n "$argv[2]" | base64)
end

function __wezterm_user_vars_postexec --on-event fish_postexec
    __wezterm_set_user_var cwd (pwd | string replace $HOME "~")
end

# TODO: is it desired behavior that an event handler must be called manually
# first to register the event handler?
__wezterm_user_vars_postexec
