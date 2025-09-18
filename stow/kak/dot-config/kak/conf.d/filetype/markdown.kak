hook -group user global BufSetOption filetype=markdown %{
    # match checked checkbox text
    add-highlighter buffer/ regex ^\h*[-*]\s\[x\]\s([^\n]*)$ 1:checked
    set-face buffer checked "white+s"
}
