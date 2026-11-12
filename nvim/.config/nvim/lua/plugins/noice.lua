return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    views = {
      mini = {
        win_options = { winblend = 0 },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- Used for the notification view; without it noice falls back to `mini`
    "rcarriga/nvim-notify",
  },
}
