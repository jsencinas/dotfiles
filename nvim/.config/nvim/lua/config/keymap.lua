-- The leader key is set in config/lazy.lua (it must exist before plugins load).
-- Plugins are required inside the callbacks so they only load when first used.
local map = vim.keymap.set

-- EDITING
map("v", "J", ":m '>+1<cr>gv=gv", { silent = true, desc = "Move selection down" })
map("v", "K", ":m '<-2<cr>gv=gv", { silent = true, desc = "Move selection up" })
map("v", "<", "<gv", { desc = "Dedent and keep selection" })
map("v", ">", ">gv", { desc = "Indent and keep selection" })
map("x", "<leader>p", '"_dP', { desc = "Paste without overwriting the register" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- Keep the cursor centered while jumping around
map("n", "J", "mzJ'z")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("i", "<C-c>", "<Esc>")
map("n", "<C-c>", "<cmd>nohlsearch<cr>")
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- TMUX NAVIGATION: <C-h/j/k/l> (in lua/plugins/tmux_navigation.lua)

-- FILE EXPLORER (sidebar)
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })
map("n", "<leader>lv", "<cmd>Neotree reveal<cr>", { desc = "Reveal current file in explorer" })

-- BUFFERS (tabs at the top)
map("n", "H", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
map("n", "L", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other buffers" })

-- TELESCOPE (live grep needs 'ripgrep' installed)
local function telescope(picker)
  return function()
    require("telescope.builtin")[picker]()
  end
end
map("n", "<leader>ff", telescope("find_files"), { desc = "Find files" })
map("n", "<leader>fg", telescope("live_grep"), { desc = "Live grep" })
map("n", "<leader>fb", telescope("buffers"), { desc = "Find buffers" })
map("n", "<leader>fr", telescope("oldfiles"), { desc = "Recent files" })
map("n", "<leader>fh", telescope("help_tags"), { desc = "Help pages" })
map("n", "<leader>fk", telescope("keymaps"), { desc = "Keymaps" })
map("n", "<leader>fw", telescope("grep_string"), { desc = "Grep word under cursor" })
map("n", "<C-p>", telescope("git_files"), { desc = "Find git-tracked files" })

-- HARPOON
local function harpoon_list()
  return require("harpoon"):list()
end
map("n", "<leader>a", function() harpoon_list():add() end, { desc = "Harpoon: add file" })
map("n", "<C-e>", function()
  local harpoon = require("harpoon")
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon: menu" })
for slot = 1, 4 do
  map("n", "<leader>" .. slot, function() harpoon_list():select(slot) end, { desc = "Harpoon: file " .. slot })
end
map("n", "<leader>hp", function() harpoon_list():prev() end, { desc = "Harpoon: previous file" })
map("n", "<leader>hn", function() harpoon_list():next() end, { desc = "Harpoon: next file" })

-- UNDOTREE
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" })

-- GIT (hunk maps are in lua/plugins/gitsigns.lua)
map("n", "<leader>gs", vim.cmd.Git, { desc = "Git status (fugitive)" })

-- TROUBLE
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix (Trouble)" })
map("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", { desc = "LSP references (Trouble)" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })

-- DIAGNOSTICS ([d and ]d jump to the previous / next one, built into Neovim)
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- LSP maps are buffer-local, see lua/plugins/lsp.lua
-- Completion maps are in lua/plugins/blink_cmp.lua
-- Formatting (<leader>cf) is in lua/plugins/conform.lua
