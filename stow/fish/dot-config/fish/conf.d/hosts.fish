# trim ".local" suffix on macs
set host (hostname | string replace '.local' '')

switch $host
    case club
        function tv
            if test $argv = on
                swaymsg output HDMI-A-1 enable
                return
            end

            if test $argv = off
                swaymsg output HDMI-A-1 disable
                return
            end

            echo "invalid arg"
            return 2
        end
    case diamond
        fish_add_path ~/dev/khan/devtools/our-lovely-cli/bin
        fish_add_path ~/dev/khan/devtools/ka-clone/bin
        fish_add_path ~/dev/khan/devtools/khan-linter/bin
        fish_add_path ~/dev/khan/devtools/google-cloud-sdk/bin
        fish_add_path ~/dev/khan/devtools/khan-dotfiles/bin
        fish_add_path ~/dev/khan/webapp/genfiles/go/bin
        fish_add_path /opt/homebrew/opt/go@1.23/bin
end
