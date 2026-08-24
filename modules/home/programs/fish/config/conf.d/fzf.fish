function __fzf_fd
    set fd_args $argv

    set base (commandline --current-token | begin
        read token
        if string length -q $token
            string replace -r '^~' $HOME $token
        else
            pwd
        end
    end)

    commandline --insert (
        fd --base-directory=$base $fd_args |
        fzf -m --prompt="$base> " |
        string join ' '
    )
end

bind ctrl-f __fzf_fd
bind ctrl-alt-f '__fzf_fd --hidden --no-ignore --follow'
