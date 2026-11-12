return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      -- One statusline for the whole editor instead of one per split
      globalstatus = true,
    },
  },
}
