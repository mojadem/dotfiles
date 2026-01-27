function fish_prompt
    set last_pipestatus $pipestatus

    set user (set_color white) (whoami)
    set host (prompt_hostname)
    set cwd (set_color cyan) (prompt_pwd)
    set vcs (set_color brblack) (fish_vcs_prompt | string trim)
    set err (string match --invert -q 0 $last_pipestatus && echo -s (set_color red) "[$last_pipestatus]")
    set sym (set_color brwhite) '> '

    if contains -- --final-rendering $argv
        echo -ns (path basename $cwd) $sym
    else
        echo -ens $user @ $host ' ' $cwd $vcs $err '\n' $sym
    end
end
