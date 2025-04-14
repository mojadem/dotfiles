function set_corne_battery
    # modified from https://github.com/zmkfirmware/zmk/pull/1243#issuecomment-2628938021

    set mac_addr F9_2F_B8_8A_B0_14
    set l_kb_path service0010/char0011
    set r_kb_path service0015/char0016

    set l_kb_hex (gdbus call --system --dest org.bluez --object-path /org/bluez/hci0/dev_$mac_addr/$l_kb_path --method org.bluez.GattCharacteristic1.ReadValue "{}"  | sed -E 's/.*0x([0-9a-fA-F]+).*/\1/')
    set r_kb_hex (gdbus call --system --dest org.bluez --object-path /org/bluez/hci0/dev_$mac_addr/$r_kb_path --method org.bluez.GattCharacteristic1.ReadValue "{}"  | sed -E 's/.*0x([0-9a-fA-F]+).*/\1/')

    set -g corne_battery_left (math 0x$l_kb_hex)
    set -g corne_battery_right (math 0x$r_kb_hex)
end

function get_corne_battery
    # do not run if corne is not connected
    set mac_addr F9:2F:B8:8A:B0:14
    if not bluetoothctl info $mac_addr | rg -q 'Connected: yes'
        set -e corne_battery_left
        set -e corne_battery_right
        return
    end

    # update every 60 seconds
    set now (date +%s)
    set mod (math "$now % 60")

    if test -z $corne_battery_left || test $mod -eq 0
        set_corne_battery
    end

    echo "Corne: $corne_battery_left% $corne_battery_right%"
end

function get_volume
    set volume_output (wpctl get-volume @DEFAULT_AUDIO_SINK@ | string split ' ')
    set volume_percent (math "100 * $volume_output[-1]")
    echo "Volume: $volume_percent%"
end

while true
    set corne_battery (get_corne_battery)
    set volume (get_volume)
    set date (date +'%a %b %d %I:%M:%S %p')

    set output $corne_battery $volume $date
    echo (string join ' | ' $output)

    sleep 1
end
