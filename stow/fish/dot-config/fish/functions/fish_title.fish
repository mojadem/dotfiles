function fish_title
    set title $argv
    set -q argv[1]; or set title (prompt_pwd)

    echo $title
end
