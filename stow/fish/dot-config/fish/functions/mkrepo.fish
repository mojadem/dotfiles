function mkrepo
    set repo ~/dev/mojadem/$argv

    mkdir $repo
    and git init $repo
end
