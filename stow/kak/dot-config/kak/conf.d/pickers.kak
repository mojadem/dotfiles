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

        directory=$(fd --type=directory | fzf --tmux=center,border-native --prompt='directory> ')
        [ -z "$directory" ] && exit

        tempbuf="temp-$(date +%s)"
        tmux display-popup -E "read | tmux load-buffer -b $tempbuf -"
        filename=$(tmux show-buffer -b $tempbuf)
        tmux delete-buffer -b $tempbuf
        [ -z "$filename" ] && exit

        echo "edit $directory$filename"
    }
}
