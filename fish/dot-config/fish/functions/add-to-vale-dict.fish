function add-to-vale-dict
    set word $argv
    set first_letter (string sub -l 1 $word)

    if string match -rq '[A-Z]' $first_letter
        echo $word >>~/.local/share/vale/styles/config/vocabularies/Default/accept.txt
    else
        echo "[$(string upper $first_letter)$first_letter]$(string sub -s 2 $word)" >>~/.local/share/vale/styles/config/vocabularies/Default/accept.txt
    end
end
