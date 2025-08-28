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
        white \
        brwhite

    for color in $colors
        set_color --background $color
        for i in (seq 1 10)
            printf ' '
        end
        set_color normal; printf ' '
        set_color $color; printf '%-9s ' $color; set_color normal
        set_color --bold $color; printf '%-14s ' "$color bold"; set_color normal
        set_color --dim $color; printf '%-13s ' "$color dim"; set_color normal
        set_color --italics $color; printf '%-17s ' "$color italics"; set_color normal
        set_color --underline $color; printf '%s' "$color underline"; set_color normal
        printf '\n'
    end
end
