evaluate-commands %sh{
    set_formatcmd() {
        filetype=$1
        cmd=$2
        printf %s "
            hook -group user global BufSetOption filetype=${filetype} %{
                set-option buffer formatcmd '${cmd}'
                hook -group format buffer BufWritePre .* format
            }
        "
    }

    set_formatcmd fish fish_indent
    set_formatcmd go gofumpt
    set_formatcmd kak 'expand -t 4 | kak -f "s[\t ]+$<ret>d" | kak -f "ge<a-?>[^\n]<ret><a-s><a-k>^\n<ret>d"'
    set_formatcmd lua 'stylua -'
    set_formatcmd markdown 'mdformat -'
    set_formatcmd nix 'nixfmt'
    set_formatcmd rust 'rustfmt'
    set_formatcmd sh 'shfmt'
    set_formatcmd toml 'taplo format -'
    set_formatcmd typescript 'prettier --parser typescript'
    set_formatcmd yaml 'yamlfmt -'
    set_formatcmd zig 'zig fmt --stdin'
}
