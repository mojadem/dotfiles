define-command move-file -override -params 1 -docstring '
    move-file <path>: move current buffile to provided path relative to buffile parent dir
' %{
    evaluate-commands %sh{
        if [ ! -f $kak_buffile ]; then
            echo "echo -markup '{Error}$kak_buffile' is not a regular file"
            exit
        fi

        dest=$@

        basedir=$(dirname $kak_bufname)
        mv $kak_bufname $basedir/$dest
        echo "rename-buffer $basedir/$dest"
    }
}

define-command -override -hidden file-picker %{
    evaluate-commands %sh{
        file=$(fd --type=file --hidden | fzf --tmux=center,border-native --prompt='file> ')
        if [ -z "$file" ]; then exit; fi
        echo "edit -existing $file"
    }
}

define-command -override -hidden buffer-picker %{
    evaluate-commands %sh{
        buffer=$(echo $kak_buflist | tr ' ' '\n' | fzf --tmux=center,border-native --prompt='buffer> ')
        if [ -z "$buffer" ]; then exit; fi
        echo "buffer $buffer"
    }
}

define-command -override -hidden line-picker %{
    evaluate-commands %sh{
        echo "write $kak_response_fifo" > $kak_command_fifo
        selected_line_number=$(cat $kak_response_fifo | nl -n ln -b a -s : | fzf --tmux=center,80%,border-native --tiebreak=index --delimiter=: --with-nth=2.. --accept-nth=1)
        if [ -z "$selected_line_number" ]; then exit; fi
        echo "execute-keys ${selected_line_number}g"
    }
}

define-command -override -hidden touch-new-file %{
    evaluate-commands %sh{
        basedir=$(fd --type=directory | fzf --tmux=center,border-native --prompt='directory> ')
        [ -z "$basedir" ] && exit

        tempbuf="temp-$(date +%s)"
        tmux display-popup -E "read -c $basedir | tmux load-buffer -b $tempbuf -"
        path=$(tmux show-buffer -b $tempbuf)
        tmux delete-buffer -b $tempbuf
        [ -z "$path" ] && exit

        echo "edit $path"
    }
}

define-command -override -hidden toggle-line-wrap %{
    try %{
        add-highlighter window/wrap wrap -indent -word -marker '>>'
    } catch %{
        remove-highlighter window/wrap
    }
}

define-command -override config-reload %{
    source ~/.config/kak/kakrc
}
