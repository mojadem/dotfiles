if type -q fisher
    fzf_configure_bindings --directory=\e\cF --history=\e\cH --variables=\e\cV --processes=\e\cP --git_log=\e\cL --git_status=\e\cS
    set fzf_preview_dir_cmd eza --icons --oneline --group-directories-first --color=always
    set fzf_fd_opts --follow
    set -g hydro_color_pwd cyan
    set -g hydro_color_git brblack
    set -g hydro_color_prompt green
    set -g hydro_color_duration yellow
    set -g hydro_color_vi_mode_default white --bold
    set -g hydro_color_vi_mode_insert brblue --bold
    set -g hydro_color_vi_mode_replace brred --bold
    set -g hydro_color_vi_mode_visual fe8019 --bold
else
    echo 'fisher not installed, run `setup_plugins`'
end
