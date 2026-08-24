if not set -q TERM_PROGRAM; or test $TERM_PROGRAM != WezTerm
    exit
end

function __wezterm_set_user_var
    command -q base64 || return
    printf "\033]1337;SetUserVar=%s=%s\007" \
        "$argv[1]" \
        (echo -n "$argv[2]" | base64 | string trim)
end

function __wezterm_user_vars_preexec --on-event fish_preexec
    # HACK: avoid premature events
    # https://github.com/fish-shell/fish-shell/issues/11740
    if not test -z $argv
        __wezterm_set_user_var command "$argv"
    end
end

function __wezterm_user_vars_postexec --on-event fish_postexec
    __wezterm_set_user_var cwd (pwd)

    # HACK: same as before
    if not test -z $argv
        __wezterm_set_user_var command
    end
end

# TODO: is it desired behavior that an event handler must be called manually
# first to register the event handler?
__wezterm_user_vars_preexec
__wezterm_user_vars_postexec
