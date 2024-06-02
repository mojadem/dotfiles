set fisher_path $__fish_user_data_dir/fisher

if not test -d $fisher_path
    echo creating $fisher_path
    mkdir $fisher_path
end

set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]

for file in $fisher_path/conf.d/*.fish
    source $file
end
