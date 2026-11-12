-- Formatting: uses the tools below, falls back to the language server
return {
  'stevearc/conform.nvim',
  cmd = 'ConformInfo',
  keys = {
    {
      '<leader>cf',
      function() require('conform').format({ async = true }) end,
      mode = { 'n', 'v' },
      desc = 'Format buffer / selection',
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
    },
    default_format_opts = { lsp_format = 'fallback' },
  },
}
