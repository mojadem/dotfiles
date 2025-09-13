hook global WinCreate .* %{
    add-highlighter window/ wrap -indent -word
}

# Add line numbers and ruler to all buffer names not wrapped in asterisks.
# Typically, these are utility buffers, not source files.
hook global WinCreate ^(?![*]).*(?![*])$ %{
    add-highlighter window/ number-lines -separator ' ' -hlcursor
    add-highlighter window/ column 80 Ruler
}

# Create parent directories on write
hook global BufWritePre .* %{ nop %sh{ mkdir -p $(dirname "$kak_hook_param") }}
