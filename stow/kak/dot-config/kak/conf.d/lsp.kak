hook global WinSetOption filetype=(go|javascript|typescript) %{
    lsp-enable-window
}
