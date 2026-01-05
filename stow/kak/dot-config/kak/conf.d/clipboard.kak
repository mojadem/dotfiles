declare-option str system_clipboard_cmd_paste %sh{
    test "$(uname)" = "Darwin" && echo 'pbpaste' || echo 'wl-paste'
}
