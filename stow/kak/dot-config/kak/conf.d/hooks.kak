# Match all buffer names not wrapped in asterisks. Typically, these are
# utility buffers, not source files.
hook global WinCreate ^(?![*]).*(?![*])$ %{
    add-highlighter window/ number-lines -separator ' ' -hlcursor
    add-highlighter window/ column 80 Ruler
}
