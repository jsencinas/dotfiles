vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
-- vim.lsp.inlay_hint.enable(true)
vim.opt.nu = true
vim.opt.relativenumber = true
-- Always show the sign column so diagnostics don't shift the text
vim.opt.signcolumn = "yes"

-- Indent with 2 spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep undo history between sessions (used by undotree)
vim.opt.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true
