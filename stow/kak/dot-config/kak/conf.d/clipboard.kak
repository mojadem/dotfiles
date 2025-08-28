declare-option str system_clipboard_cmd_yank %sh{
    test "$(uname)" = "Darwin" && echo 'pbcopy' || echo 'wl-copy'
}

declare-option str system_clipboard_cmd_paste %sh{
    test "$(uname)" = "Darwin" && echo 'pbpaste' || echo 'wl-paste'
}

define-command -override yank-buffer-name %{
    nop %sh{
        printf "%s" $kak_bufname | $kak_opt_system_clipboard_cmd_yank
    }
}
