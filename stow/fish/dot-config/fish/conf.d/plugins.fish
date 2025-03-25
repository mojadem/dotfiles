if type -q fisher
    set -g hydro_symbol_prompt '>'
    set -g hydro_symbol_git_dirty '*'
    set -g hydro_color_prompt green --bold
    set -g hydro_color_pwd cyan
    set -g hydro_color_git brblack
    set -g hydro_color_duration yellow
    set -g hydro_color_vi_mode_default white --bold
    set -g hydro_color_vi_mode_insert brblue --bold
    set -g hydro_color_vi_mode_replace brred --bold
    set -g hydro_color_vi_mode_visual fe8019 --bold
else
    echo 'fisher not installed, run `setup_plugins`'
end
