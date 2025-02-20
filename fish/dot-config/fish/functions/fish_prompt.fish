function fish_prompt
    set path_color (set_color normal; set_color cyan)
    set path_brcolor (set_color normal; set_color --bold brcyan)
    set git_color (set_color normal; set_color brblack)
    set prompt_color (set_color normal; set_color --bold green)

    set git_str ''
    set prompt_str '>'

    set repo (git rev-parse --show-toplevel 2>/dev/null)
    set repo_path (prompt_pwd $repo | string split '/')
    set full_path (prompt_pwd | string split '/')

    set path_str ''
    for i in (seq 1 (count $full_path))
        set p $repo_path[$i]
        if test -z $p
            set p $full_path[$i]
        end

        set color $path_color
        if test $i = (count $repo_path) -o $i = (count $full_path)
            set color $path_brcolor
        end

        set path_str "$path_str$color$p$path_color/"
    end

    set path_str (string replace -r '/$' '' $path_str)

    set branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if not test -z $branch
        set git_str " $branch"
    end

    set path "$path_color$path_str"
    set git "$git_color$git_str"
    set prompt "$prompt_color$prompt_str"

    echo "$path$git $prompt "
end
