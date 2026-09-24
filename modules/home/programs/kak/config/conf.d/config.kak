hook -group user global User config-loaded %{
    source-local-config
}

define-command -override -hidden source-local-config %{
    evaluate-commands %sh{
        if [ ! -e .kakrc ]; then exit; fi

        trust_dir=$XDG_DATA_HOME/kak/trust
        mkdir -p "$trust_dir"

        kakrc_path=$(realpath .kakrc)
        path_hash=$(printf %s "$kakrc_path" | shasum | cut -d ' ' -f1)
        trust_file=$trust_dir/$path_hash.sha256

        if [ -e "$trust_file" ] && shasum -a 256 -cs "$trust_file"; then
            echo 'source .kakrc'
            exit
        fi

        printf %s "
            hook -group user global User prompt-for-trust %{
                edit .kakrc
                prompt 'Trust $kakrc_path? y/[n]: ' %{
                    evaluate-commands %sh{
                        if [ \"\$kak_text\" = \"y\" ]; then
                            shasum -a 256 '$kakrc_path' > '$trust_file'
                            echo 'source .kakrc'
                        fi
                    }
                }
            }
        "
    }
}

hook -group user -once global ClientCreate .* %{
    trigger-user-hook prompt-for-trust
}

define-command -override source-config -docstring '
    source-config: source ~/.config/kak/kakrc
' %{
    evaluate-commands %{
        source ~/.config/kak/kakrc
        trigger-user-hook prompt-for-trust
    }
}
alias global sc source-config
