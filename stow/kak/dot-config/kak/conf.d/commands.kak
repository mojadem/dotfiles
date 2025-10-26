define-command -override config-reload %{
    source ~/.config/kak/kakrc
}

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

define-command -override yank-buffer-name %{
    nop %sh{
        printf "%s" $kak_bufname | $kak_opt_system_clipboard_cmd_yank
    }
}

define-command -override yank-line-github-link %{
    nop %sh{
        repo=$(git remote get-url origin | sed 's|git@github.com:|https://github.com/|' | sed 's/\.git$//')
        ref=$(git rev-parse HEAD)
        printf "${repo}/blob/${ref}/${kak_bufname}#L${kak_cursor_line}" | $kak_opt_system_clipboard_cmd_yank
    }
}


define-command -override -hidden pick-file %{
    evaluate-commands %sh{
        file=$(fd --type=file --hidden | fzf --tmux=center,border-native )
        if [ -z "$file" ]; then exit; fi
        echo "edit -existing $file"
    }
}

define-command -override -hidden pick-buffer %{
    evaluate-commands %sh{
        buffer=$(echo $kak_buflist | tr ' ' '\n' | fzf --tmux=center,border-native)
        if [ -z "$buffer" ]; then exit; fi
        echo "buffer $buffer"
    }
}

define-command -override -hidden pick-buffers-to-delete %{
    evaluate-commands %sh{
        buffers=$(echo $kak_buflist | tr ' ' '\n' | fzf --tmux=center,border-native --multi)
        [ -z "$buffers" ] && exit

        for b in $buffers; do
            echo "delete-buffer $b"
        done
    }
}

define-command -override -hidden pick-line %{
    evaluate-commands %sh{
        echo "write $kak_response_fifo" > $kak_command_fifo
        selected_line_number=$(cat $kak_response_fifo | nl -n ln -b a -s : | fzf --tmux=center,80%,border-native --tiebreak=index --delimiter=: --with-nth=2.. --accept-nth=1)
        if [ -z "$selected_line_number" ]; then exit; fi
        echo "execute-keys ${selected_line_number}g"
    }
}

define-command -override -hidden fuzzy-grep %{
    evaluate-commands %sh{
        selection=$(
            fzf \
                --accept-nth '{1} {2} {3}' \
                --ansi \
                --bind 'change:reload:rg --color=always --line-number --column --smart-case --regexp={q} || true' \
                --bind 'tab:toggle-preview' \
                --delimiter : \
                --disabled \
                --preview 'bat {1} --highlight-line {2} --color=always --style=plain' \
                --preview-window '+{2}/2' \
                --tmux=center,border-native,90% \
       )
       [ -z "$selection" ] && exit

        echo "edit -existing $selection"
    }
}

define-command -override -hidden toggle-line-wrap %{
    try %{
        add-highlighter window/wrap wrap -word -indent -width 80 -marker '>> '
    } catch %{
        remove-highlighter window/wrap
    }
}

define-command -override -hidden touch-new-file %{
    evaluate-commands %sh{
        basedir=$(fd --type=directory | fzf --tmux=center,border-native)
        [ -z "$basedir" ] && exit

        tempbuf="temp-$(date +%s)"
        tmux display-popup -E "read -c $basedir | tmux load-buffer -b $tempbuf -"
        path=$(tmux show-buffer -b $tempbuf)
        tmux delete-buffer -b $tempbuf
        [ -z "$path" ] && exit

        echo "edit $path"
    }
}

define-command -override open-file-explorer %{
    evaluate-commands %sh{
        dir=$(dirname $kak_buffile)

        tempbuf="temp-$(date +%s)"
        tmux display-popup -E "cd $dir && flirt | tmux load-buffer -b $tempbuf -"
        files=$(tmux show-buffer -b $tempbuf)
        tmux delete-buffer -b $tempbuf

        for f in $files; do
            echo "edit -existing $f"
        done
    }
}
