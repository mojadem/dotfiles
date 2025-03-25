rbw unlock

if test $status != 0
    notify-send Bitwarden 'Error unlocking vault'
    exit $status
end

set selection (rbw ls | fuzzel --prompt 'bitwarden> ' --dmenu)

# exit if nothing is picked
if test $status != 0
    exit $status
end

set password (rbw get $selection)

wl-copy $password
notify-send Bitwarden (echo $selection 'password copied')

# clear the password from clipboard history after a delay
set delay 15

set totp (rbw totp $selection)

# if the vault item doesn't have a totp, this is skipped
if test $status = 0
    # sleep for 5 seconds before copying totp to give time for pasting
    sleep 5
    set delay (math $delay - 5)
    wl-copy $totp
    notify-send Bitwarden (echo $selection 'totp copied')
end

# clear password and totp from clipboard history after delay
sleep $delay
cliphist delete-query $password
cliphist delete-query $totp
notify-send Bitwarden (echo $selection 'password cleared')
