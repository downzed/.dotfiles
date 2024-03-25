return {
  { "folke/neodev.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('neodev').setup({})

      local lsp_config = require('lspconfig')
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = { 'lua_ls', 'eslint', 'rust_analyzer', 'bashls' },
        handlers = {
          function(server)
            require('lspconfig')[server].setup({
              capabilities = lsp_capabilities
            })
          end,
          rust_analyzer = nil,
          bashls = function()
            lsp_config.bashls.setup({
              capabilities = lsp_capabilities,
              filetypes = { "sh" },
              single_file_support = true,
              name = 'bash',
              cmdline = { 'bash-language-server', 'start' },
            })
          end,
          eslint = function()
            lsp_config.eslint.setup({
              capabilities = lsp_capabilities,
              root_dir = lsp_config.util.root_pattern("package.json"),
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
          end,
          lua_ls = function()
            lsp_config.lua_ls.setup({
              capabilities = lsp_capabilities,
              settings = {
                Lua = {
                  runtime = {
                    version = 'LuaJIT',
                  },
                  diagnostics = {
                    globals = { 'vim' }
                  },
                  format = {
                    enable = true,
                  },
                }
              }
            })
          end
        }
      })

      local check_eslint_config = function(client)
        if client.name ~= "eslint" and client.name ~= "tsserver" then
          return false
        end
        return true
      end

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      -- vim.keymap.set('n', '<leader>e', ':Telescope diagnostics<CR>')
      vim.keymap.set('n', '<leader>ws', ':Telescope lsp_dynamic_workspace_symbols <CR>',
        { desc = "[W]orkspace [S]ymbols" })
      vim.keymap.set('n', '<leader>ds', ':Telescope lsp_document_symbols <CR>', { desc = "[D]ocument [S]ymbols" })
      vim.keymap.set('n', '<leader>od', ':lua vim.diagnostic.open_float()<CR>', { desc = "[O]pen [D]iagnostic" })
      vim.keymap.set('n', '<leader>d]', ':lua vim.diagnostic.goto_next()<CR>', { desc = "Next ] [D]iagnostic" })
      vim.keymap.set('n', '<leader>d[', ':lua vim.diagnostic.goto_prev()<CR>', { desc = "Prev [ [D]iagnostic" })

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local ts_builtin = require('telescope.builtin')

          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = "[R]e[n]ame" })
          vim.keymap.set('n', 'gd', ts_builtin.lsp_definitions, { buffer = ev.buf, desc = "[G]o to [D]efinitions" })
          vim.keymap.set('n', 'gr', ts_builtin.lsp_references, { buffer = ev.buf, desc = "[G]o to [R]eferences" })
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = "[G]o to [I]mplementation" })
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature Help" })
          vim.keymap.set('n', '<leader>Dt', vim.lsp.buf.type_definition,
            { buffer = ev.buf, desc = "[D]efinition [T]ype" })

          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action,
            { buffer = ev.buf, desc = "[C]ode [A]ction" })
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover" })

          -- -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
          -- -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
          -- -- vim.keymap.set('n', '<leader>wl', function()
          -- --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          -- -- end, opts)

          if client.name == 'lua_ls' then
            vim.keymap.set('n', '<leader>hc', ":help <C-R><C-W><CR>", { buffer = ev.buf, desc = "[H]elp under [C]ursor" })
            -- vim.keymap.set('n', '<leader>h', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature Help" })
            --   vim.api.nvim_set_keymap('n', '<leader>hc', ':help <C-R><C-W><CR>',
            --     { noremap = true, buffer = ev.buf, silent = true, desc = "[H]elp under [C]ursor" })
          end

          -- Formatting

          local format_opt = { buffer = ev.buf, desc = "[F]ormat" }

          if check_eslint_config(client) then
            vim.keymap.set("n", "<leader>F", ":EslintFixAll<CR>", format_opt)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = ev.buf,
              command = ":EslintFixAll",
            })
          else
            vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, format_opt)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = ev.buf,
              command = "lua vim.lsp.buf.format()"
            })
          end

          print("[" .. client.name .. "] ")
        end,
      }

      vim.api.nvim_create_autocmd('LspAttach', on_attach)
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- config = function()
    --   local mason_lspconfig = require("mason-lspconfig")

    --   mason_lspconfig.setup({
    --     ensure_installed = { 'lua_ls', 'eslint' }
    --   })
    -- end
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
