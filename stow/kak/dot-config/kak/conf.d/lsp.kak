hook global WinSetOption filetype=(go|lua|javascript|typescript) %{
    lsp-enable-window

    map global user l ':enter-user-mode lsp<ret>' -docstring 'LSP mode'
}
