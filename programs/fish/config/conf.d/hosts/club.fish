abbr syspend "sleep 5; systemctl suspend"

alias pi "env OPENROUTER_API_KEY=(pass show api/openrouter) pi"

if status is-login; and test (tty) = /dev/tty1
    function launch_environment --on-event init_done
        read -P "exec sway? [y]/n > " choice
        test -z $choice
        and exec sway
    end
end
