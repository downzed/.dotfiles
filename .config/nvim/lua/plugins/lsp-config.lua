return {
  "yioneko/nvim-vtsls", -- typescript/javascript lsp
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<leader>e', ':Telescope diagnostics<CR>')

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
          -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
          -- vim.keymap.set('n', '<leader>wl', function()
          --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          -- end, opts)
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
          -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
          vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
        end,
      }

      vim.api.nvim_create_autocmd('LspAttach', on_attach)

      vim.g.rustaceanvim = {
        server = {
          on_attach = on_attach
        }
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)

          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
          local opts = { buffer = bufnr }

          vim.keymap.set('n', '<leader>f', ':EslintFixAll<CR>', opts)
        end
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
    end,

  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = { 'lua_ls', 'eslint' }
      })
    end
  },
  {
    "williamboman/mason.nvim",
    config = function()
      local mason = require('mason')

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  }
}
