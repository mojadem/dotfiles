set -x MANPATH $__fish_data_dir/man

function man --wraps man
    kak -e "man $argv"
end
