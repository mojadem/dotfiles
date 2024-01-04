function refresh
    source ~/.config/fish/config.fish
    echo "config.fish refreshed"
    cat ~/.config/fish/config.fish
    commandline -f repaint
end
