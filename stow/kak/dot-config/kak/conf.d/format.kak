evaluate-commands %sh{
    set_formatcmd() {
        echo "hook -group user global BufSetOption filetype=$1 %{
            set-option buffer formatcmd '$2'
            hook buffer BufWritePre .* format
        }"
    }

    set_formatcmd go gofumpt
    set_formatcmd kak 'expand -t 4 | sed "s/[[:blank:]]*$//"'
    set_formatcmd fish fish_indent
    set_formatcmd toml 'taplo format -'
    set_formatcmd typescript 'prettier --parser typescript'
}

