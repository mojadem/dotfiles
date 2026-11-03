function current-yk --description 'Identify the connected YubiKey'
    set -l serials (ykman list --serials)
    or begin
        echo 'current-yk: failed to list YubiKeys' >&2
        return 1
    end

    if test (count $serials) -ne 1
        echo 'current-yk: connect exactly one YubiKey' >&2
        return 1
    end

    switch $serials[1]
        case 37813278
            echo yk1
        case 37813238
            echo yk2
        case '*'
            echo "current-yk: unknown YubiKey: $serials[1]" >&2
            return 1
    end
end
