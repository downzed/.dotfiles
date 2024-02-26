return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      local check_eslint_config = function(client)
        local eslint_config = vim.fn.glob(".eslintrc*")

        -- if client name is not eslint
        if eslint_config == "" or client.name ~= "eslint" or client.name ~= "tsserver" then
          return false
        end

        return true
      end

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      -- vim.keymap.set('n', '<leader>e', ':Telescope diagnostics<CR>')
      vim.keymap.set('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>')

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
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local ts_builtin = require('telescope.builtin')

          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', ts_builtin.lsp_definitions, opts)
          vim.keymap.set('n', 'gr', ts_builtin.lsp_references, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

          -- -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
          -- -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
          -- -- vim.keymap.set('n', '<leader>wl', function()
          -- --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          -- -- end, opts)
          -- -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

          -- Formatting
          if check_eslint_config(client) then
            vim.keymap.set("n", "<leader>f", ":EslintFixAll<CR>", opts)
          else
            vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
          end
        end,
      }

      vim.api.nvim_create_autocmd('LspAttach', on_attach)

      vim.g.rustaceanvim = {
        server = {
          on_attach = on_attach
        }
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
        root_dir = lspconfig.util.root_pattern("package.json", "package-lock.json"),
        filetypes = {
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "javascript",
          "javascriptreact",
          "javascript.jsx"
        },
        single_file_support = true
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
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
