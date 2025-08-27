declare-option str system_clipboard_cmd_yank %sh{
    test "$(uname)" = "Darwin" && echo 'pbcopy' || echo 'wl-copy'
}

declare-option str system_clipboard_cmd_paste %sh{
    test "$(uname)" = "Darwin" && echo 'pbpaste' || echo 'wl-paste'
}

map global window v ':tmux-terminal-horizontal kak -c %val{session}<ret>' -docstring 'vertical split'
map global window s ':tmux-terminal-vertical kak -c %val{session}<ret>' -docstring 'horizontal split'

map global user b ':buffer-picker<ret>' -docstring 'buffer picker'
map global user f ':file-picker<ret>' -docstring 'file picker'
map global user l ':line-picker<ret>' -docstring 'line picker'

map global user y "<a-|>%opt{system_clipboard_cmd_yank}<ret>:echo yanked selection to system clipboard<ret>" -docstring 'yank to system clipboard'
map global user p "<a-!>%opt{system_clipboard_cmd_paste}<ret>" -docstring 'paste system clipboard after selection'
map global user P "!%opt{system_clipboard_cmd_paste}<ret>" -docstring 'paste system clipbard before selection'

map global user w ':enter-user-mode window<ret>' -docstring 'window mode'


