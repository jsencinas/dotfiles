return {
  -- Auto-close brackets and quotes
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
  -- Indentation guides
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', event = { 'BufReadPost', 'BufNewFile' }, opts = {} },
}
