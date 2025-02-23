function fish_right_prompt
    if not test -z $VIRTUAL_ENV_PROMPT
        echo "$(set_color yellow)($VIRTUAL_ENV_PROMPT)"
    end
end
