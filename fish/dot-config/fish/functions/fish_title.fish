function fish_title
    if test (pwd) = $HOME
        set -f dir '~'
    else
        set -f dir (basename (pwd))
    end

    set -f process (status current-command)

    set -f dir (string shorten --max 15 $dir)
    set -f process (string shorten --max 5 $process)

    set -f title "$dir $process"

    echo $title
end
