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
        if echo $fzf_input | rg --quiet $match
            continue
        end

        if test $match = (prompt_pwd)
            continue
        end

        set -a fzf_input $match
    end
end

set selection (string join \n $fzf_input | fzf --tmux center,border-native)
test -z $selection; and exit

set copy_cmd (test (uname) = Darwin; and echo pbcopy; or echo wl-copy)
printf "%s" $selection | $copy_cmd
