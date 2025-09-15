hook global BufSetOption filetype=typescript %{
    set-option buffer formatcmd 'prettier --parser typescript'
    hook buffer BufWritePre .* format
}
