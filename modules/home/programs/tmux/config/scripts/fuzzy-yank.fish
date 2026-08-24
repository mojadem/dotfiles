set patterns \
    # sync tags
    "perl -pli -e '.*sync-start.*' '[^']+'" \
    # links
    'https?:\/\/[^>\)\s]+' \
    # unix paths
    '(\/|~\/|\.\.?\/)?([\w\.-]+\/)+[\w\.-]+' \
    # sha1 hashes
    '[0-9a-f]{7,40}'

set exclusions \
    # prompt path
    (prompt_pwd)

set rg_pattern (string join '|' $patterns)
set rg_exclude (string join '|' $exclusions)

set pane_text (tmux capture-pane -p -J | tac)
set matches (echo $pane_text | rg -o $rg_pattern | rg -v $rg_exclude | sort -u)

if test (count $matches) = 0
    tmux display-message 'no matches found'
    exit
end

set selection (string join -- \n $matches | fzf --tmux center,border-native)
test -z $selection && exit

echo -n $selection | tmux load-buffer -w -
tmux display-message "copied: $selection"
