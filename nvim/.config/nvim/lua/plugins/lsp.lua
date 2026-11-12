-- Per-server overrides, merged on top of the defaults nvim-lspconfig ships.
-- Every key here is installed through Mason and enabled automatically.
local servers = {
  clangd = {}, -- C / C++
  jdtls = {}, -- Java
  pyright = {}, -- Python
  bashls = {}, -- Bash
  rust_analyzer = {}, -- Rust
  html = {}, -- HTML
  cssls = {}, -- CSS
  ts_ls = {}, -- JavaScript / TypeScript
  lua_ls = { -- Lua
    settings = {
      Lua = {
        completion = { callSnippet = 'Replace' },
      },
    },
  },
}

-- Non-LSP tools Mason should also install
local tools = { 'stylua' }

return {
  {
    -- Completion, annotations and signatures for the Neovim Lua API
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- Supplies the default config (cmd, filetypes, root markers) of each server
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} }, -- LSP progress messages
    },
    config = function()
      for name, config in pairs(servers) do
        if next(config) then
          vim.lsp.config(name, config)
        end
      end

      local ensure_installed = vim.tbl_keys(servers)
      vim.list_extend(ensure_installed, tools)
      require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

      -- Calls vim.lsp.enable() for every server installed through Mason
      require('mason-lspconfig').setup({
        -- stylua runs through conform.nvim, not as a language server
        automatic_enable = { exclude = { 'stylua' } },
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if not client then
            return
          end

          local function map(keys, func, desc, mode)
            vim.keymap.set(mode or 'n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Neovim already maps: K (hover), grn (rename), gra (code action),
          -- grr (references), gri (implementation), gO (document symbols),
          -- <C-s> in insert mode (signature help), [d / ]d (diagnostics).
          map('gd', vim.lsp.buf.definition, 'Go to definition')
          map('gD', vim.lsp.buf.declaration, 'Go to declaration')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code action', { 'n', 'v' })
          map('<leader>cr', vim.lsp.buf.rename, 'Rename symbol')
          map('<leader>fs', function()
            require('telescope.builtin').lsp_dynamic_workspace_symbols()
          end, 'Find workspace symbols')

          if client:supports_method('textDocument/inlayHint', event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }), { bufnr = event.buf })
            end, 'Toggle inlay hints')
          end

          -- Highlight the other references of the symbol under the cursor
          if client:supports_method('textDocument/documentHighlight', event.buf) then
            local group = vim.api.nvim_create_augroup('user-lsp-highlight', { clear = false })
            vim.api.nvim_clear_autocmds({ group = group, buffer = event.buf })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = group,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = group,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('user-lsp-detach', { clear = true }),
        callback = function(event)
          vim.lsp.buf.clear_references()
          pcall(vim.api.nvim_clear_autocmds, { group = 'user-lsp-highlight', buffer = event.buf })
        end,
      })
    end,
  },
}
