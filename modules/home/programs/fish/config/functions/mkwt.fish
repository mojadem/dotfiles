function mkwt
    set -l branch $argv

    set -l repo (string join / (path basename (path dirname $PWD)) (path basename $PWD))
    set -l path ~/dev/.wt/$repo/$branch

    echo git worktree add -B $branch $path
    git worktree add -B $branch $path
end
