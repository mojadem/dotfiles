declare-option str system_clipboard_cmd_yank %sh{
    test "$(uname)" = "Darwin" && echo 'pbcopy' || echo 'wl-copy'
}

declare-option str system_clipboard_cmd_paste %sh{
    test "$(uname)" = "Darwin" && echo 'pbpaste' || echo 'wl-paste'
}
