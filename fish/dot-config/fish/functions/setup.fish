# various setup functions for different use cases
function setup
    if test $argv = plugins
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
        fisher update
        tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time=No --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Sparse --icons='Few icons' --transient=Yes
        echo setup plugins complete
        return
    end

    if test $argv = aider
        set aider_env $XDG_DATA_HOME/aider/default.env

        if not test -e $aider_env
            echo $aider_env not found
            return 1
        end

        cp $aider_env $PWD/.env
        echo aider setup complete
        return
    end

    echo bad arg
    return 2
end
