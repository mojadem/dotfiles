define-command -override toggle-column %{
    try %{
        add-highlighter window/column column 80 Ruler
    } catch %{
        remove-highlighter window/column
    }
}

define-command -override toggle-number-lines %{
    try %{
        add-highlighter window/number-lines number-lines -hlcursor -separator ' '
    } catch %{
        remove-highlighter window/number-lines
    }
}

define-command -override toggle-wrap %{
    try %{
        add-highlighter global/wrap wrap -indent -marker '>>' -width 80 -word
    } catch %{
        remove-highlighter global/wrap
    }
}


# Add number lines and column to buffers with names not wrapped in asterisks.
# This will affect source files, not utility buffers.
hook -group user global WinCreate ^(?![*]).*(?![*])$ %{
    toggle-column
    toggle-number-lines
}
