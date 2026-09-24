hook -group user global BufSetOption filetype=nix %{
    map global pipe S '<a-i>[_x|sort<ret>' -docstring 'sort nix list'
}
