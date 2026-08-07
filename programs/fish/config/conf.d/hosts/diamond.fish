fish_add_path ~/dev/khan/our-lovely-cli/bin
fish_add_path ~/dev/khan/ka-clone/bin
fish_add_path ~/dev/khan/khan-linter/bin
fish_add_path ~/dev/khan/google-cloud-sdk/bin
fish_add_path ~/dev/khan/khan-dotfiles/bin
fish_add_path ~/dev/khan/webapp/genfiles/go/bin

set -q JAVA_HOME || set -x JAVA_HOME (/usr/libexec/java_home)
fish_add_path "/opt/homebrew/opt/openjdk@21/bin"

function deploy-status
    git symbolic-ref refs/remotes/origin/HEAD |
        string match -r 'master|main' |
        read main_name

    set main "origin/$main_name"
    set deploy deploy/mojadem
    set comparison "$deploy...$main"

    echo "$comparison"
    git rev-list --count --left-right $comparison |
        read ahead behind

    echo "$ahead commits ahead, $behind commits behind"
end

function _init_mise --on-event init_done
    # TODO: switch to nixpkg instead of brew
    mise activate --shims fish | source

    functions --erase _init_mise
end
