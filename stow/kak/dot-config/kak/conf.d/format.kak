evaluate-commands %sh{
    set_formatcmd() {
        filetype=$1
        cmd=$2
        printf %s "
            hook -group user global BufSetOption filetype=${filetype} %{
                set-option buffer formatcmd '${cmd}'
            }
        "
    }

    set_autoformat() {
        filetype=$1
        printf %s "
            hook -group user-autoformat-${filetype} global BufSetOption filetype=${filetype} %{
                hook -group format buffer BufWritePre .* format
            }
        "
    }

    set_formatcmd fish fish_indent && set_autoformat fish
    set_formatcmd go gofmt && set_autoformat go
    set_formatcmd json 'jq'
    set_formatcmd kak 'expand -t 4 | kak -f "s[\t ]+$<ret>d" | kak -f "ge<a-?>[^\n]<ret><a-s><a-k>^\n<ret>d"' && set_autoformat kak
    set_formatcmd lua 'stylua -'
    set_formatcmd markdown 'mdformat -'
    set_formatcmd nix 'nixfmt' && set_autoformat nix
    set_formatcmd rust 'rustfmt' && set_autoformat rust
    set_formatcmd sh 'shfmt' && set_autoformat sh
    set_formatcmd typescript 'prettier --parser typescript' && set_autoformat typescript
    set_formatcmd yaml 'yamlfmt -'
    set_formatcmd zig 'zig fmt --stdin' && set_autoformat zig
}

define-command -override autoformat-disable -params 0..1 -docstring '
    autoformat-disable [<filetype>]: disable autoformat for the specified filetype or current buffer filetype
' %{
    evaluate-commands %sh{
        if [ -z "$1" ]; then
            echo "remove-hooks buffer format"
            echo "set global disabled_hooks user-autoformat-$kak_opt_filetype"
        else
            echo "set global disabled_hooks user-autoformat-$1"
        fi
    }
}
