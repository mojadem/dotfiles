function jj --wraps jj
    if test "$argv[1]" = git; and test "$argv[2]" = push
        set -l yk (current-yk)
        or return 1

        command jj --config "signing.key=$HOME/.ssh/id_ed25519_sk_$yk" $argv
    else
        command jj $argv
    end
end
