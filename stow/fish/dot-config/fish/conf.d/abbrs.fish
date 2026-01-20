abbr lg lazygit
abbr root "cd (git rev-parse --show-toplevel)"

function _init_abbrs --on-event init_done
    abbr e $EDITOR

    functions --erase _init_abbrs
end
