hook global BufCreate .*[.](csv) %{
    set-option buffer filetype csv
}

add-highlighter -override shared/csv group
add-highlighter -override shared/csv/ regex '([^,\n]*,?)([^,\n]*,?)([^,\n]*,?)([^,\n]*,?)([^,\n]*,?)([^,\n]*,?)([^,\n]*,?)' 1:bright-red 2:bright-yellow 3:bright-green 4:bright-cyan 5:bright-blue 6:bright-magenta 7:bright-white

hook -group user global BufSetOption filetype=csv %{
    add-highlighter buffer/csv ref csv
}
