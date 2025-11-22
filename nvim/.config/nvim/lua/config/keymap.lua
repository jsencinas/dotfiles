-- imports
local builtin = require('telescope.builtin')
local harpoon = require("harpoon")
local blink = require("blink.cmp")

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Vim builtin commands
vim.keymap.set("n", "<leader>lv", vim.cmd.Ex, { desc = 'Open the file explorer within vim' })

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("n", "J", "mzJ'z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")

-- vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>")

-- TMUX NAVIGATION (In ~/.config/nvim/lua/plugins/tmux_navigation.lua file)

-- TELESCOPE
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = 'Telescope grep a string respecting .gitignore' })
--[[ vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end
)
--]]
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = 'Telescope find files respecting .gitignore' })

-- HARPOON
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- UNDOTREE
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- FUGITIVE
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- BLINK AUTOCOMPLETION
vim.keymap.set("i", "<C-k>", blink.insert_prev)
vim.keymap.set("i", "<C-j>", blink.insert_next)
vim.keymap.set("i", "<C- >", blink.accept)

-- TROUBLE
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", vim.tbl_extend("force", opts, { desc = "Diagnostics (Trouble)" }))
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", vim.tbl_extend("force", opts, { desc = "Quickfix (Trouble)" }))
vim.keymap.set("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", vim.tbl_extend("force", opts, { desc = "LSP References (Trouble)" }))
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", vim.tbl_extend("force", opts, {desc = "Symbols (Trouble)"}))

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user-lsp-keymaps', { clear = true }),
  callback = function(event)
      local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end
    -- Keybindings for your keymaps.lua
    map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('<leader>vws', vim.lsp.buf.workspace_symbol, '[V]iew [W]orkspace [S]ymbols')
    map('<leader>vd', vim.diagnostic.open_float, '[V]iew [D]iagnostic')
    map('[d', vim.diagnostic.goto_next, 'Next [D]iagnostic')
    map(']d', vim.diagnostic.goto_prev, 'Previous [D]iagnostic')

    map('<leader>vca', vim.lsp.buf.code_action, '[V]iew [C]ode [A]ction')
    map('<leader>vrr', vim.lsp.buf.references, '[V]iew [R]efe[R]ences')
    map('<leader>vrn', vim.lsp.buf.rename, '[V]iew [R]e[N]ame', {"n", "v"})
    map('<C-h>', vim.lsp.buf.signature_help, 'Signature [H]elp', "i")
  end,
})
-- Not a keymap, gets rid of the lsp icons
--[[
vim.diagnostic.config({
    virtual_text = true, -- Keep virtual text if you like it
    signs = false,       -- This is the key line to disable signs in the sign column
})
--]]
-- Avoids the annoying lsp code shift
vim.opt.signcolumn = 'yes'
