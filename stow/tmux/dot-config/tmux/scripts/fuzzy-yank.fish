set copy_patterns \
    # links
    'https?:\/\/[^>\)\s]+' \
    # unix paths
    '(\/|~\/|\.\.?\/)?([\w\.-]+\/)+[\w\.-]+' \
    # sha1 hashes
    '[0-9a-f]{7,40}'

# Pane text is reversed so that more recent text will appear first in fzf.
set pane_text (tmux capture-pane -p | tac)
set fzf_input

for pattern in $copy_patterns
    for match in (echo $pane_text | rg --only-matching --regexp=$pattern)
        # This handles duplicates, as well as the case where part of a url is
        # detected as a unix path.
        if not echo $fzf_input | rg --quiet $match
            set -a fzf_input $match
        end
    end
end

set selection (string join \n $fzf_input | fzf --tmux center)
test -z $selection; and exit

# TODO: support linux clipboard
printf "%s" $selection | pbcopy
