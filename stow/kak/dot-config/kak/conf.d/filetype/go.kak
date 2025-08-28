hook global BufSetOption filetype=go %{
    hook buffer BufWritePre .* lsp-formatting-sync
}
