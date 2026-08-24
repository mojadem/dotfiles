set host (uname -n)
set file $__fish_config_dir/conf.d/hosts/$host.fish

test -e $file
and source $file
