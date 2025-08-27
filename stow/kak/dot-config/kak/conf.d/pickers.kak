define-command -override -hidden file-picker %{
    evaluate-commands %sh{
        file=$(fd --type=file --hidden | fzf --tmux=center --prompt='file> ')
        if [ -z "$file" ]; then exit; fi
        echo "edit -existing $file"
    }
}

define-command -override -hidden buffer-picker %{
    evaluate-commands %sh{
        buffer=$(echo $kak_buflist | tr ' ' '\n' | fzf --tmux=center --prompt='buffer> ')
        if [ -z "$buffer" ]; then exit; fi
        echo "buffer $buffer"
    }
}

define-command -override -hidden line-picker %{
    evaluate-commands %sh{
        echo "write $kak_response_fifo" > $kak_command_fifo
        selected_line_number=$(cat $kak_response_fifo | nl -n ln -b a -s : | fzf --tmux=center --tiebreak=index --delimiter=: --with-nth=2.. --accept-nth=1)
        if [ -z "$selected_line_number" ]; then exit; fi
        echo "execute-keys ${selected_line_number}g"
    }
}

