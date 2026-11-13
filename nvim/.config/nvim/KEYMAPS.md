# Neovim keymaps

`<leader>` is **Space**. Press `<leader>` and wait to see the groups in which-key, or `<leader>fk` to search every keymap.

Unless noted, maps are for normal mode.

## Files and navigation

| Key | Action |
|---|---|
| `<leader>e` | Toggle the file explorer sidebar |
| `<leader>lv` | Reveal the current file in the sidebar |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (needs `ripgrep`) |
| `<leader>fw` | Grep the word under the cursor |
| `<leader>fb` | Find open buffers |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help pages |
| `<leader>fk` | Search keymaps |
| `<leader>fs` | Workspace symbols (LSP) |
| `<C-p>` | Find git-tracked files |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Move between splits and tmux panes |
| `<C-\>` | Previous split / tmux pane |

## Buffers (tabs at the top)

| Key | Action |
|---|---|
| `H` / `L` | Previous / next buffer |
| `<leader>bd` | Close buffer |
| `<leader>bo` | Close all other buffers |

## Harpoon

| Key | Action |
|---|---|
| `<leader>a` | Add current file |
| `<C-e>` | Open the Harpoon menu |
| `<leader>1` … `<leader>4` | Jump to file 1–4 |
| `<leader>hp` / `<leader>hn` | Previous / next Harpoon file |

## Code (LSP)

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `<C-t>` | Jump back after `gd` |
| `K` | Hover documentation |
| `grr` | References |
| `gri` | Implementation |
| `gO` | Symbols in this file |
| `<leader>ca` | Code action (normal and visual) |
| `<leader>cr` | Rename symbol |
| `<leader>cf` | Format buffer or selection |
| `<leader>cd` | Show the diagnostic on this line |
| `<leader>cs` | Symbols panel (Trouble) |
| `<leader>th` | Toggle inlay hints |
| `[d` / `]d` | Previous / next diagnostic |
| `<C-s>` (insert) | Signature help |

## Diagnostics panel (Trouble)

| Key | Action |
|---|---|
| `<leader>xx` | All diagnostics |
| `<leader>xX` | Diagnostics for this buffer |
| `<leader>xr` | LSP references |
| `<leader>xq` | Quickfix list |

## Git

| Key | Action |
|---|---|
| `<leader>gs` | Git status (fugitive) |
| `[h` / `]h` | Previous / next changed hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gS` | Stage / unstage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gb` | Blame current line |
| `<leader>gd` | Diff this file |

## Completion (insert mode)

| Key | Action |
|---|---|
| `<C-j>` / `<C-k>` | Next / previous item |
| `<C-Space>` | Accept the item, or open the menu if it is closed |
| `<C-e>` | Hide the menu |
| `<C-d>` | Toggle the documentation popup |
| `<Tab>` / `<S-Tab>` | Next / previous snippet field |

## Editing

| Key | Mode | Action |
|---|---|---|
| `J` / `K` | visual | Move the selection down / up |
| `<` / `>` | visual | Dedent / indent and keep the selection |
| `<leader>p` | visual | Paste over the selection without losing the register |
| `<leader>y` | normal, visual | Yank to the system clipboard |
| `J` | normal | Join lines, cursor stays in place |
| `n` / `N` | normal | Next / previous search match, centered |
| `<C-d>` / `<C-u>` | normal | Half page down / up, centered |
| `<Esc>` or `<C-c>` | normal | Clear search highlight |
| `<C-c>` | insert | Leave insert mode |
| `<leader>u` | normal | Toggle the undo tree |
| `<leader>tm` | normal | Toggle markdown rendering |

## Where they are defined

| Maps | File |
|---|---|
| General, Telescope, Harpoon, Trouble, buffers | `lua/config/keymap.lua` |
| LSP | `lua/plugins/lsp.lua` |
| Git hunks | `lua/plugins/gitsigns.lua` |
| Completion | `lua/plugins/blink_cmp.lua` |
| Formatting | `lua/plugins/conform.lua` |
| Tmux navigation | `lua/plugins/tmux_navigation.lua` |
| `<leader>xX` | `lua/plugins/trouble.lua` |
| Markdown rendering | `lua/plugins/render_markdown.lua` |
