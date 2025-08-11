function colors
    set colors \
        black \
        brblack \
        red \
        brred \
        green \
        brgreen \
        yellow \
        bryellow \
        blue \
        brblue \
        magenta \
        brmagenta \
        cyan \
        brcyan \
        white

    for color in $colors
        set_color $color
        echo $color
        set_color --bold $color
        echo $color bold
        set_color normal
    end
end
