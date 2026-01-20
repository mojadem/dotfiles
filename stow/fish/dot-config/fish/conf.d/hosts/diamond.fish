fish_add_path ~/dev/khan/our-lovely-cli/bin
fish_add_path ~/dev/khan/ka-clone/bin
fish_add_path ~/dev/khan/khan-linter/bin
fish_add_path ~/dev/khan/google-cloud-sdk/bin
fish_add_path ~/dev/khan/khan-dotfiles/bin
fish_add_path ~/dev/khan/webapp/genfiles/go/bin

set -q JAVA_HOME || set -x JAVA_HOME (/usr/libexec/java_home)
fish_add_path "/opt/homebrew/opt/openjdk@21/bin"
