hook -group user global WinCreate .* %{
    evaluate-commands %sh{
        # exit if not associated with a file
        if [ ! -e "$kak_buffile" ]; then
            exit
        fi

        # exit if not in a git directory
        cd $(dirname "$kak_buffile")
        if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
            exit
        fi

        echo "git show-diff"
        echo "hook window BufWritePost .* %{ git update-diff }"
        echo "hook window BufReload .* %{ git update-diff }"
    }
}
