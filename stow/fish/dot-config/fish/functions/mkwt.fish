function mkwt
    set branch $argv

    set repo_dir (git rev-parse --show-toplevel)
    set repo_name (path basename $repo_dir)
    set wt_dir (path resolve $repo_dir/../$repo_name-$branch)

    git worktree add $wt_dir $branch
    and echo Added worktree at $wt_dir
end
