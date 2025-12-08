declare-option str-list lsp_filetypes \
    'go' \
    'javascript' \
    'lua' \
    'python' \
    'rust' \
    'typescript' \
    'zig' \

declare-option -hidden regex lsp_filetypes_regex %sh{
    printf "(%s)" "$(printf '%s' "$kak_opt_lsp_filetypes" | tr ' ' '|')"
}

declare-option -hidden bool lsp_init_done

hook -group user global WinSetOption "filetype=%opt{lsp_filetypes_regex}" %{
    evaluate-commands %sh{
        $kak_opt_lsp_init_done && exit
        echo "eval %sh{kak-lsp}"
    }
    set-option global lsp_init_done true

    set-option global lsp_snippet_support false

    lsp-enable-window

    map window user l ':enter-user-mode lsp<ret>' -docstring 'LSP mode'

    map window object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
    map window object f '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
    map window object t '<a-semicolon>lsp-object Class Interface Struct<ret>' -docstring 'LSP class interface or struct'
    map window object d '<a-semicolon>lsp-diagnostic-object --include-warnings<ret>' -docstring 'LSP errors and warnings'
    map window object D '<a-semicolon>lsp-diagnostic-object<ret>' -docstring 'LSP errors'
}
