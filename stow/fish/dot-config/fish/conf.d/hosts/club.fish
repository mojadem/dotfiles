if status is-login; and test (tty) = /dev/tty1
    function launch_environment --on-event init_done
        echo "Select environment:"
        echo "1) Sway"
        echo "2) KDE Plasma"
        echo "*) cancel"

        read -P "[1] > " choice
        test -z $choice && set choice 1

        switch $choice
            case 1
                exec sway
            case 2
                exec dbus-run-session startplasma-wayland
            case *
                # Continue to shell.
        end
    end
end
