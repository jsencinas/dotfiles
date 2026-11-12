-- VS Code style sidebar: files, open buffers and git status
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  lazy = false, -- so it can take over when opening a directory (nvim .)
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    close_if_last_window = true,
    source_selector = { winbar = true }, -- clickable Files / Buffers / Git tabs
    window = { width = 32 },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      hijack_netrw_behavior = 'open_default',
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
  },
}
