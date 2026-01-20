function _init_path --on-event init_done
    # Add custom PATH entries last so they are first in PATH search.
    fish_add_path --move ~/.local/bin
    fish_add_path --move $CARGO_HOME/bin
    fish_add_path --move $GOPATH/bin
    fish_add_path --move $PNPM_HOME

    functions --erase _init_path
end
