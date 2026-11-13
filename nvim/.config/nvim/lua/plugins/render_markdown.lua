-- Renders markdown (headings, tables, code blocks...) inside the buffer.
-- The cursor line and insert mode always show the raw text.
return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    { '<leader>tm', '<cmd>RenderMarkdown toggle<cr>', desc = 'Toggle markdown rendering' },
  },
}
