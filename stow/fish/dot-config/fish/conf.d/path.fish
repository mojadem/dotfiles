fish_add_path ~/.local/bin
fish_add_path $CARGO_HOME/bin
fish_add_path $GOPATH/bin

function _init_path --on-event init_done
    # Ensure this is at the front of PATH so node versions installed with
    # `pnpm env` are the default.
    fish_add_path --move $PNPM_HOME

    functions --erase _init_path
end
