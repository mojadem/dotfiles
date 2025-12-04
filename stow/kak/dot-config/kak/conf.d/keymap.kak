map global insert <c-down> <c-n>
map global insert <c-up> <c-p>

map global user / ':pick-line<ret>' -docstring 'pick line'
map global user b ':pick-buffer<ret>' -docstring 'pick buffer'
map global user B ':pick-buffers-to-delete<ret>' -docstring 'pick buffers to delete'
map global user f ':pick-file<ret>' -docstring 'pick file'
map global user g ':fuzzy-grep<ret>' -docstring 'fuzzy grep'

map global user c ':comment-line<ret>' -docstring 'comment line'
map global user d ':delete-buffer<ret>' -docstring 'delete buffer'
map global user e ':open-file-explorer<ret>' -docstring 'open file explorer at current directory'
map global user p '<a-!>$kak_opt_system_clipboard_cmd_paste<ret>' -docstring 'paste system clipboard after selection'
map global user P '!$kak_opt_system_clipboard_cmd_paste<ret>' -docstring 'paste system clipbard before selection'
map global user r ':toggle-wrap<ret>' -docstring 'toggle line wrap'
map global user s ':spell<ret>' -docstring 'spell check'
map global user S ':spell-clear<ret>' -docstring 'clear spell check'
map global user t ':touch-new-file<ret>' -docstring 'touch new file'
map global user y '<a-|>$kak_opt_system_clipboard_cmd_yank<ret>:echo yanked selection to system clipboard<ret>' -docstring 'yank to system clipboard'

map global user | ':enter-user-mode pipe<ret>' -docstring 'pipe mode'
map global pipe s '|sort<ret>' -docstring 'sort'
map global pipe p '|par s0T4w80<ret>' -docstring 'par'

map global user w ':enter-user-mode window<ret>' -docstring 'window mode'
map global window v ':tmux-terminal-horizontal kak -c %val{session}<ret>' -docstring 'vertical split'
map global window s ':tmux-terminal-vertical kak -c %val{session}<ret>' -docstring 'horizontal split'
