hook global WinSetOption filetype=(go|lua|javascript|typescript) %{
    lsp-enable-window
}
