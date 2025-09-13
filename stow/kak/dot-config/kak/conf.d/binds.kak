map global window v ':tmux-terminal-horizontal kak -c %val{session}<ret>' -docstring 'vertical split'
map global window s ':tmux-terminal-vertical kak -c %val{session}<ret>' -docstring 'horizontal split'

map global user b ':buffer-picker<ret>' -docstring 'buffer picker'
map global user f ':file-picker<ret>' -docstring 'file picker'
map global user / ':line-picker<ret>' -docstring 'line picker'

map global user r ':toggle-line-wrap<ret>' -docstring 'toggle line wrap'
map global user t ':touch-new-file<ret>' -docstring 'touch new file'

map global user d ':delete-buffer<ret>' -docstring 'delete buffer'
map global user c ':comment-line<ret>' -docstring 'comment line'

map global user y '<a-|>$kak_opt_system_clipboard_cmd_yank<ret>:echo yanked selection to system clipboard<ret>' -docstring 'yank to system clipboard'
map global user p '<a-!>$kak_opt_system_clipboard_cmd_paste<ret>' -docstring 'paste system clipboard after selection'
map global user P '!$kak_opt_system_clipboard_cmd_paste<ret>' -docstring 'paste system clipbard before selection'

map global user w ':enter-user-mode window<ret>' -docstring 'window mode'
