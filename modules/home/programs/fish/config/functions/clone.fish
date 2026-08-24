function clone
    if not string match -qr '^[^/]+/[^/]+$' $argv
        echo "expected format 'owner/repo'"
        return 1
    end

    set slug (string lower $argv)
    git clone git@github.com:$slug.git ~/dev/$slug
end
