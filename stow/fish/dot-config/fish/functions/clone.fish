function clone
    if not string match -qr '^[^/]+/[^/]+$' $argv
        echo "expected format 'owner/repo'"
        return 1
    end

    git clone git@github.com:$argv.git ~/dev/$argv
end
