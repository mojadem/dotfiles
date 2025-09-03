hook global BufSetOption filetype=kak %{
    set-option buffer formatcmd 'expand -t 4 | sed "s/[[:blank:]]*$//"'
    hook buffer BufWritePre .* format
}
