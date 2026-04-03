define-command -override autoformat-enable -params 0..1 -docstring '
    autoformat-enable [<filetype>]: enable autoformat for the specified filetype or current buffer filetype
' %{
    evaluate-commands %sh{
            filetype=${1:-$kak_opt_filetype}
        printf %s "
            hook -group user-autoformat-$filetype global BufSetOption filetype=$filetype %{
                hook -group format buffer BufWritePre .* format
            }
        "

        if [ -z "$1" ]; then
            echo "hook -group format buffer BufWritePre .* format"
        fi
    }
}

define-command -override autoformat-disable -params 0..1 -docstring '
    autoformat-disable [<filetype>]: disable autoformat for the specified filetype or current buffer filetype
' %{
    evaluate-commands %sh{
        filetype=${1:-$kak_opt_filetype}
        echo "remove-hooks global user-autoformat-$filetype"

        if [ -z "$1" ]; then
            echo "remove-hooks buffer format"
        fi
    }
}

evaluate-commands %sh{
    set_formatcmd() {
        filetype=$1
        cmd=$2
        printf %s "
            hook -group user global BufSetOption filetype=${filetype} %{
                set-option buffer formatcmd '${cmd}'
            }
            autoformat-enable $filetype
        "
    }

    set_formatcmd fish fish_indent
    set_formatcmd go gofmt
    set_formatcmd json 'jq'
    set_formatcmd kak 'expand -t 4 | kak -f "s[\t ]+$<ret>d" | kak -f "ge<a-?>[^\n]<ret><a-s><a-k>^\n<ret>d"'
    set_formatcmd lua 'stylua -'
    set_formatcmd markdown 'mdformat -'
    set_formatcmd nix 'nixfmt'
    set_formatcmd rust 'rustfmt'
    set_formatcmd sh 'shfmt'
    set_formatcmd typescript 'prettier --parser typescript'
    set_formatcmd yaml 'yamlfmt -'
    set_formatcmd zig 'zig fmt --stdin'
}
