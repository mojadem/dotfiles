test $hostname = club || exit

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
