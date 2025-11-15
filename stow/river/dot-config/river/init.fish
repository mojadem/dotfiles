#!/usr/bin/env fish

set term foot
set browser qutebrowser
set menu fuzzel --no-icons

riverctl map normal Super Return spawn $term
riverctl map normal Super+Shift Return spawn $browser
riverctl map normal Super Space spawn $menu

riverctl map normal Super F toggle-fullscreen
riverctl map normal Super Q close
riverctl map normal Super Z zoom

riverctl map normal Super+Control Q spawn 'swaylock -i ~/pictures/wallpapers/wallpaper.png'
riverctl map normal Super+Control C spawn '~/.config/river/init'
riverctl map normal Super+Control E exit

riverctl map normal Super Up focus-view up
riverctl map normal Super Down focus-view down
riverctl map normal Super Right focus-view right
riverctl map normal Super Left focus-view left

riverctl map normal Super+Shift Up swap up
riverctl map normal Super+Shift Down swap down
riverctl map normal Super+Shift Right swap right
riverctl map normal Super+Shift Left swap left

for i in (seq 1 9)
    # sets bit field to have a 1 at digit $i
    set tags (math 2^(math $i - 1))

    riverctl map normal Control $i set-focused-tags $tags
    riverctl map normal Control+Shift $i set-view-tags $tags
    riverctl map normal Alt+Control $i toggle-focused-tags $tags
    riverctl map normal Alt+Shift+Control $i toggle-view-tags $tags
end

# sets bit field to have a 1 at all digits
set all_tags 4294967295 # max 32 bit uint
riverctl map normal Control 0 set-focused-tags $all_tags
riverctl map normal Control+Shift $i set-view-tags $all_tags

riverctl map normal Super+Shift V spawn 'cliphist list | fuzzel --prompt "clipboard> " --dmenu --lines 30 --width 60 --tabs 1 | cliphist decode | wl-copy'

riverctl background-color 0x1d2021
riverctl border-color-focused 0xebdbb2
riverctl border-color-unfocused 0x282828

riverctl rule-add -title '*DEBUG*' float

riverctl default-layout rivertile

set padding 10
killall rivertile

wl-paste --watch cliphist store &

wlr-randr --output DP-3 --mode 3440x1440@144Hz
wlr-randr --output HDMI-A-1 --off

killall rivertile
rivertile -view-padding $padding -outer-padding $padding &

killall yambar
yambar &

killall mako
mako &
