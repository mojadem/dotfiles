function pick-pr
    argparse --name=pick-pr h/help 's/state=' 'L/limit=' -- $argv
    or return

    if set --query _flag_help
        echo 'usage: pick-pr [--state STATE] [--limit COUNT] [USER]'
        return 0
    end

    if test (count $argv) -gt 1
        echo 'pick-pr: expected at most one USER' >&2
        return 2
    end

    if set --query _flag_state
        if not contains -- $_flag_state open closed
            echo 'pick-pr: --state must be open or closed' >&2
            return 2
        end
    end

    if set --query _flag_limit
        if not string match --quiet --regex '^[1-9][0-9]*$' -- $_flag_limit
            echo 'pick-pr: --limit must be a positive integer' >&2
            return 2
        end
    end

    set -l user @me
    if test (count $argv) = 1
        set user "@$user"
    end

    set -l gh_args search prs \
        --involves $user \
        --sort updated \
        --json repository,number,author,state,title \
        --jq '.[] | "\(.repository.nameWithOwner)#\(.number)\t\(.author.login)\t\(.state)\t\(.title)"'

    if set --query _flag_state
        set --append gh_args --state $_flag_state
    end

    if set --query _flag_limit
        set --append gh_args --limit $_flag_limit
    end

    set -l selections (command gh $gh_args | column -t -s \t | fzf -m)
    or return

    for selection in $selections
        set -l reference (string split --max 1 ' ' -- $selection)[1]
        set -l pull_request (string split --max 1 '#' -- $reference)
        set -l repo $pull_request[1]
        set -l number $pull_request[2]

        command gh pr view --web --repo $repo $number
        or return
    end
end
