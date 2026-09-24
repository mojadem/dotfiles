function titled --description 'Set the terminal title with fish_title, then run a command'
    printf '\e]0;%s\a' (fish_title "$argv")
    $argv
end
