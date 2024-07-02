function fish_title
    if test (pwd) = $HOME
        set dir '~'
    else
        set dir (basename (pwd))
    end

    set process (status current-command)

    if test $process = fish
        set process
    end

    set dir (string shorten --max 15 $dir)
    set process (string shorten --max 5 $process)

    set title "$dir $process"

    echo $title
end
