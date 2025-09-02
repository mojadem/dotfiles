hook global BufSetOption filetype=toml %{
    set-option buffer formatcmd 'taplo format -'
    hook buffer BufWritePre .* format
}
