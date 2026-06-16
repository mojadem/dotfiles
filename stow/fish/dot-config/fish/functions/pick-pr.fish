function pick-pr
    argparse --name=pick-pr h/help 's/state=' -- $argv
    or return

    if set --query _flag_help
        echo 'usage: pick-pr [--state STATE] [AUTHOR]'
        return 0
    end

    if test (count $argv) -gt 1
        echo 'pick-pr: expected at most one AUTHOR' >&2
        return 2
    end
    set author (test (count $argv) = 1; and echo $argv; or echo me)

    set state (set -q _flag_state; and echo $_flag_state; or echo open)
    if not contains -- $state open closed
        echo 'pick-pr: --state must be open or closed' >&2
        return 2
    end

    if test "$author" = me
        begin
            gh search prs --author @me --state $state --json repository,number,title
            gh search prs --assignee @me --state $state --json repository,number,title
        end |
            jq -s 'add | unique_by(.repository.nameWithOwner, .number)'
    else
        gh search prs --author "@$author" --state $state --json repository,number,title
    end |
        jq '.[] | "\(.repository.nameWithOwner)#\(.number)\t\(.title)"' -r |
        fzf -m |
        awk '{print $1}' |
        string replace --all '#' ' ' |
        while read repo pr
            gh pr view -w -R $repo $pr
        end
end
