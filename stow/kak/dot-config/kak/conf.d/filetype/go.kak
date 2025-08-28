hook global BufSetOption filetype=go %{
    set-option buffer formatcmd gofumpt
    hook buffer BufWritePre .* format
}
