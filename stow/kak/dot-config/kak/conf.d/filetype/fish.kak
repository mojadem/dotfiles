hook global BufSetOption filetype=fish %{
    set-option buffer formatcmd fish_indent
    hook buffer BufWritePre .* format
}
