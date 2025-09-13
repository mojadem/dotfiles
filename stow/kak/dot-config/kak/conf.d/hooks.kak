# Add highlighters to all buffer names not wrapped in asterisks.
# This should exclude utility buffers, not source files.
hook global WinCreate ^(?![*]).*(?![*])$ %{
    add-highlighter window/ number-lines -separator ' ' -hlcursor
    add-highlighter window/ column 80 Ruler
}

# Create parent directories on write
hook global BufWritePre .* %{ nop %sh{ mkdir -p $(dirname "$kak_hook_param") }}
