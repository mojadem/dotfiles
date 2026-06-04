function pick-pr
    set author me
    if test (count $argv) -ne 0
        set author $argv
    end

    gh search prs --author "@$author" --state open --json repository,number,title |
        jq '.[] | "\(.repository.nameWithOwner)#\(.number)\t\(.title)"' -r |
        fzf |
        awk '{print $1}' |
        string replace '#' ' ' |
        xargs gh pr view -w -R
end
