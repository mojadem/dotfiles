# Create parent directories on write.
hook -group user global BufWritePre .* %{ nop %sh{ mkdir -p $(dirname "$kak_hook_param") }}
