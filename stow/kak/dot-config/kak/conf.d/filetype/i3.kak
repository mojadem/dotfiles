# By default, Kakoune sets paths matching `.*sway/config` to filetype i3. I want
# to also set paths in my conf.d directory.
hook global BufCreate .*sway/conf.d/.* %{
    set buffer filetype i3
}
