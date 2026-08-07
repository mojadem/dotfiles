function mkrepo
    if not string match -qr '^[^/]+/[^/]+$' $argv
        echo "expected format 'owner/repo'"
        return 1
    end

    set repo ~/dev/$argv
    mkdir $repo
    and git init $repo
end
