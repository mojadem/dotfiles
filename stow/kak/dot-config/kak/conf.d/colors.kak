# Based on gruvbox-dark
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

set-face global BufferPadding "white"
set-face global DiagnosticError "red"
set-face global DiagnosticWarning "yellow"
set-face global Error "red"
set-face global Information "white"
set-face global LineNumberCursor "bright-white"
set-face global LineNumbers "bright-black"
set-face global LineNumbersWrapped "black"
set-face global MenuBackground "white,%opt{bg_1}"
set-face global MenuForeground "bright-white,%opt{bg_2}"
set-face global MenuInfo "white"
set-face global Prompt "cyan"
set-face global Ruler "default,%opt{bg_s}"
set-face global StatusLine "bright-white"
set-face global StatusCursor "black,bright-white"
set-face global StatusLineInfo "white"
set-face global StatusLineValue "bright-white"
set-face global StatusLineMode "cyan"
set-face global WrapMarker "%opt{bg_2}"

# Default syntax highlighting
set-face global attribute "bright-blue"
set-face global builtin "bright-red"
set-face global comment "bright-black+i"
set-face global documentation "bright-black"
set-face global function "bright-cyan"
set-face global keyword "bright-red"
set-face global meta "%opt{orange}"
set-face global module "bright-white"
set-face global operator "%opt{orange}"
set-face global string "bright-green"
set-face global type "bright-yellow"
set-face global value "bright-magenta"
set-face global variable "bright-white"

# Markdown highlighting
set-face global title "green+b"
set-face global header "%opt{orange}"
set-face global mono "white"
set-face global block "cyan"
set-face global link "blue+u"
set-face global bullet "yellow"
set-face global list "bright-white"

# Tree-sitter syntax highlighting
set-face global ts_comment "bright-black+i"
set-face global ts_constant "bright-magenta"
set-face global ts_function "bright-cyan"
set-face global ts_keyword "bright-red"
set-face global ts_namespace "bright-white"
set-face global ts_operator "%opt{orange}"
set-face global ts_punctuation "%opt{orange}"
set-face global ts_string "bright-green"
set-face global ts_string_regexp "bright-yellow"
set-face global ts_tag "bright-magenta"
set-face global ts_type "bright-yellow"
set-face global ts_variable "bright-white"
set-face global ts_variable_other_member "bright-blue"
set-face global ts_variable_parameter "bright-blue+i"

set-face global ts_markup_bold "default+b"

set-face global ts_markup_heading "bright-cyan"
set-face global ts_markup_italic "default+i"
set-face global ts_markup_link_label "green"
set-face global ts_markup_link_text "bright-green"
set-face global ts_markup_link_uri "blue"
set-face global ts_markup_link_url "blue"
set-face global ts_markup_quote "white+i"
set-face global ts_markup_raw "bright-red"
set-face global ts_markup_strikethrough "default+s"
