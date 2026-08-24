function fish_right_prompt
    set prompt

    if set -q VIRTUAL_ENV_PROMPT
        set -a prompt '[venv]'
    end

    if set -q IN_NIX_SHELL
        set -a prompt '[nix]'
    end

    if set -q fish_private_mode
        set -a prompt '[private]'
    end

    echo (set_color blue) $prompt
end
