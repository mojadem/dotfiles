function fish_title
    set -f dir (basename (pwd))
    set -f process (status current-command)
    echo "$dir $process"
end
