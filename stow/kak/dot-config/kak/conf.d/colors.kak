# gruvbox-dark
declare-option str bg_s "rgb:32302f"
declare-option str bg_1 "rgb:3c3836"
declare-option str bg_2 "rgb:504945"
declare-option str bg_3 "rgb:665c54"
declare-option str orange "rgb:d65d0e"

# Built-ins
set-face global Default "bright-white,black"

set-face global PrimaryCursor "black,bright-white"
set-face global PrimaryCursorEol PrimaryCursor
set-face global PrimarySelection "default,%opt{bg_2}"
set-face global SecondaryCursor "black,white"
set-face global SecondaryCursorEol SecondaryCursor
set-face global SecondarySelection "default,%opt{bg_1}"

hook global ModeChange .*:.*:insert %{
    set-face window PrimaryCursor "default,%opt{bg_3}"
    set-face window PrimaryCursorEol PrimaryCursor
    set-face window SecondaryCursor "default,%opt{bg_2}"
    set-face window SecondaryCursorEol SecondaryCursor
}

hook global ModeChange .*:insert:.* %{
    unset-face window PrimaryCursor
    unset-face window PrimaryCursorEol
    unset-face window SecondaryCursor
    unset-face window SecondaryCursorEol
}

set-face global LineNumbers "bright-black"
set-face global LineNumbersWrapped "black"
set-face global LineNumberCursor "bright-white"

set-face global Ruler "default,%opt{bg_s}"

set-face global MenuForeground "bright-white,%opt{bg_2}+b"
set-face global MenuBackground "white,%opt{bg_1}"
set-face global MenuInfo "yellow,default"

set-face global Information "yellow"
set-face global InlineInformation "red,red" #TODO

set-face global Error "red"
set-face global DiagnosticError "red"
set-face global DiagnosticWarning "yellow"

set-face global StatusLine "bright-white"

set-face global StatusLineMode "cyan"
set-face global StatusLineInfo "white"
set-face global StatusLineValue "cyan"
set-face global StatusCursor "black,bright-white"

set-face global Prompt "cyan"

set-face global BufferPadding "white"

# Custom
set-face global Path "blue"

# Default syntax highlighting
set-face global attribute "blue"
set-face global builtin "red"
set-face global comment "bright-black+i"
set-face global documentation "red,red" #TODO
set-face global function "green"
set-face global keyword "red"
set-face global meta "red,red" #TODO
set-face global module "bright-white"
set-face global operator "%opt{orange}"
set-face global string "bright-green"
set-face global type "yellow"
set-face global value "magenta"
set-face global variable "bright-white"

# Tree-sitter syntax highlighting
set-face global ts_comment "bright-black+i"
set-face global ts_constant "magenta"
set-face global ts_function "green"
set-face global ts_keyword "red"
set-face global ts_namespace "bright-white"
set-face global ts_operator "%opt{orange}"
set-face global ts_punctuation "%opt{orange}"
set-face global ts_string "bright-green"
set-face global ts_string_regexp "yellow"
set-face global ts_type "yellow"
set-face global ts_variable "bright-white"
set-face global ts_variable_other_member "blue"
set-face global ts_variable_parameter "blue+i"

# hook window ModeChange push:normal:insert %{
#     set-face window PrimaryCursor

#evaluate-commands %sh#{
#    gray="rgb:928374"
#    red="rgb:fb4934"
#    green="rgb:b8bb26"
#    yellow="rgb:fabd2f"
#    blue="rgb:83a598"
#    purple="rgb:d3869b"
#    aqua="rgb:8ec07c"
#    orange="rgb:fe8019"
#
#    bg="rgb:282828"
#    bg_alpha="rgba:282828a0"
#    bg1="rgb:3c3836"
#    bg2="rgb:504945"
#    bg3="rgb:665c54"
#    bg4="rgb:7c6f64"
#
#    fg="rgb:ebdbb2"
#    fg_alpha="rgba:ebdbb2a0"
#    fg0="rgb:fbf1c7"
#    fg2="rgb:d5c4a1"
#    fg3="rgb:bdae93"
#    fg4="rgb:a89984"
#
#    echo "
#        # Code highlighting
#        face global value         ${purple}
#        face global type          ${yellow}
#        face global variable      ${blue}
#        face global module        ${green}
#        face global function      ${fg}
#        face global string        ${green}
#        face global keyword       ${red}
#        face global operator      ${fg}
#        face global attribute     ${orange}
#        face global comment       ${gray}+i
#        face global documentation comment
#        face global meta          ${aqua}
#        face global builtin       ${fg}+b
#
#        # Markdown highlighting
#        face global title     ${green}+b
#        face global header    ${orange}
#        face global mono      ${fg4}
#        face global block     ${aqua}
#        face global link      ${blue}+u
#        face global bullet    ${yellow}
#        face global list      ${fg}
#
#    "
#}
