-- Git change markers in the sign column, plus hunk actions
return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')
      local function map(keys, func, desc, mode)
        vim.keymap.set(mode or 'n', keys, func, { buffer = bufnr, desc = 'Git: ' .. desc })
      end

      map(']h', function() gitsigns.nav_hunk('next') end, 'Next hunk')
      map('[h', function() gitsigns.nav_hunk('prev') end, 'Previous hunk')
      map('<leader>gp', gitsigns.preview_hunk, 'Preview hunk')
      map('<leader>gS', gitsigns.stage_hunk, 'Stage / unstage hunk')
      map('<leader>gr', gitsigns.reset_hunk, 'Reset hunk')
      map('<leader>gb', function() gitsigns.blame_line({ full = true }) end, 'Blame line')
      map('<leader>gd', gitsigns.diffthis, 'Diff this file')
    end,
  },
}
