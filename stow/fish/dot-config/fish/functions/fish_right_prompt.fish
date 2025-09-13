function fish_right_prompt
    set prompt

    if not test -z $VIRTUAL_ENV_PROMPT
        set -a prompt "($VIRTUAL_ENV_PROMPT)"
    end

    if not test -z $fish_private_mode
        set -a prompt "(private)"
    end

    echo (set_color brblack) $prompt
end
