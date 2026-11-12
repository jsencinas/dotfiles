vim.diagnostic.config({
  severity_sort = true,
  -- Set to true for live diagnostics while typing
  update_in_insert = false,
  underline = true,
  float = { border = 'rounded', source = 'if_many' },
  virtual_text = { source = 'if_many', spacing = 2 },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '!',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
})
