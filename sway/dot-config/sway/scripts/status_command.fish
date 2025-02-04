set volume (wpctl get-volume @DEFAULT_AUDIO_SINK@)
set date (date +'%a %b %d %I:%M:%S %p')

echo $volume '|' $date
