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

