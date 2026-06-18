argparse copy slurp -- $argv

contains $argv screenshot record
or exit 2

# Short circuit to toggle off active recording.
if test $argv = record
    pgrep wf-recorder &>/dev/null
    and pkill -INT wf-recorder
    and exit

    notify-send 'Starting recording...'
end

set timestamp (date +%s)
set out (
    test $argv = screenshot
    and echo ~/pictures/$timestamp.png
    or echo ~/videos/$timestamp.mp4
)

# Modes
# 1: screenshot
# 2: screenshot + copy
# 3: screenshot + slurp
# 4: screenshot + copy + slurp
# 5: record
# 6: record + slurp

test $argv = screenshot
and not set -q _flag_copy
and not set -q _flag_slurp
and set mode 1

test $argv = screenshot
and set -q _flag_copy
and not set -q _flag_slurp
and set mode 2

test $argv = screenshot
and not set -q _flag_copy
and set -q _flag_slurp
and set mode 3

test $argv = screenshot
and set -q _flag_copy
and set -q _flag_slurp
and set mode 4

test $argv = record
and not set -q _flag_slurp
and set mode 5

test $argv = record
and set -q _flag_slurp
and set mode 6

switch $mode
    case 1
        # 1: screenshot
        grim $out
    case 2
        # 2: screenshot + copy
        set out clipboard
        grim - | wl-copy
    case 3
        # 3: screenshot + slurp
        grim -g (slurp) $out
    case 4
        # 4: screenshot + copy + slurp
        set out clipboard
        grim -g (slurp) - | wl-copy
    case 5
        # 5: record
        wf-recorder -f $out
    case 6
        # 6: record + slurp
        wf-recorder -g (slurp) -f $out
end
notify-send "Saved to $out"
not test $out = clipboard
and echo -n $out | copy
