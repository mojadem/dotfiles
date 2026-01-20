# Add custom PATH entries last so they are first in PATH search.
function add_path_entries --on-event init_done
    fish_add_path --move ~/.local/bin
    fish_add_path --move $CARGO_HOME/bin
    fish_add_path --move $GOPATH/bin
    fish_add_path --move $PNPM_HOME
end
