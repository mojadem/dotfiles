return {
  {
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function()
        return {
          timeout_ms = 500,
          lsp_fallback = false,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        fish = { 'fish_indent' },
        go = { 'gofumpt', 'golines' },
        javascript = { { 'biome', 'prettier' } },
        javascriptreact = { { 'biome', 'prettier' } },
        ['_'] = { 'trim_whitespace', 'trim_newlines' },
      },
    },
  },
}
