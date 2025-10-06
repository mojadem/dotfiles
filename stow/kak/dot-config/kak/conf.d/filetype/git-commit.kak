hook -group user global BufSetOption filetype=git-commit %{
    hook buffer NormalIdle .* %{ spell }
}
