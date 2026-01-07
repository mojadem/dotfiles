function fish_prompt
    set last_pipestatus $pipestatus

    set user (set_color white) (whoami)
    set host (prompt_hostname)
    set cwd (set_color cyan) (prompt_pwd -D 2)
    set vcs (set_color brblack) (fish_vcs_prompt | string trim)
    set err (string match --invert -q 0 $last_pipestatus && echo -s (set_color red) "[$last_pipestatus]")
    set sym (set_color brwhite) '> '

    echo -ns $user @ $host ' ' $cwd $vcs $err $sym
end
