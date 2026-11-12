-- Open buffers shown as tabs at the top (H / L to cycle)
return {
  'akinsho/bufferline.nvim',
  version = '*',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      always_show_bufferline = false,
      offsets = {
        { filetype = 'neo-tree', text = 'Explorer', highlight = 'Directory', separator = true },
      },
    },
  },
}
