set emoji_file $XDG_DATA_HOME/emojis.txt

if not test -e $emoji_file
    curl -sSL "https://unicode.org/Public/emoji/latest/emoji-test.txt" | sed -ne 's/^.*; fully-qualified.*# \(\S*\) \S* \(.*$\)/\1 \2/gp' >$emoji_file
end

set selection (cat $emoji_file | fuzzel --prompt 'emoji> ' --dmenu)

# overwrite emoji file with recently used selections at top
echo -es $selection '\n' (rg --invert-match $selection $emoji_file | string collect) >$emoji_file

# get just the emoji from selection
set emoji (string split ' ' $selection | head --lines 1 | string collect)

wtype -s 30 $emoji

# copy as a fallback (see https://github.com/atx/wtype/issues/37), maybe switch to ydotool
wl-copy $emoji
