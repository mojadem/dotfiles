function fish_prompt
    set last_pipestatus $pipestatus

    set cwd (set_color cyan) (prompt_pwd)
    set vcs (set_color brblack) (fish_vcs_prompt | string trim)
    set err (string match --invert -q 0 $last_pipestatus && echo -s (set_color red) "[$last_pipestatus]")
    set sym (set_color brwhite) '> '

    echo -ns $cwd $vcs $err $sym
end
