add-highlighter global/ number-lines -separator ' ' -hlcursor

declare-user-mode window

# plugins
eval %sh{kak-lsp}
lsp-enable
