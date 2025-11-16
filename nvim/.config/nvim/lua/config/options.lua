vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
-- vim.lsp.inlay_hint.enable(true)
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2

-- vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.cmd([[
    highlight diagnosticunderlineerror gui=undercurl guisp=red
    highlight diagnosticunderlinewarn  gui=undercurl guisp=yellow
    highlight diagnosticunderlineinfo  gui=undercurl guisp=blue
    highlight diagnosticunderlinehint  gui=undercurl guisp=green
]])
