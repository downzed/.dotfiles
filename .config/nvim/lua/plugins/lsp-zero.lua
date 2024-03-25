return {
  { 'folke/neodev.nvim', opts = {} },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      {
        'williamboman/mason.nvim',
      },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
    },
    config = function()
      require('neodev').setup({})
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
        local set = vim.keymap.set

        local nbind = function(lhs, rhs, desc)
          set("n", lhs, rhs, {
            buffer = bufnr,
            desc = desc,
            remap = false,
            noremap = true,
            silent = true
          })
        end

        -- nbind('K', vim.lsp.buf.hover, "Hover")
        nbind('<leader>ws', ':Telescope lsp_dynamic_workspace_symbols <cr>', "[W]orkspace [S]ymbols")
        nbind('<leader>ds', ':Telescope lsp_document_symbols<cr>', "[D]ocument [S]ymbols")
        nbind('<leader>od', vim.diagnostic.open_float, "[O]pen [D]iagnostic")
        nbind('<leader>d]', vim.diagnostic.goto_next, "Next ] [D]iagnostic")
        nbind('<leader>d[', vim.diagnostic.goto_prev, "Prev [ [D]iagnostic")

        nbind("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        nbind("<leader>rn", vim.lsp.buf.rename, "[R]ename")
        nbind("<leader>f", '<cmd>LspZeroFormat<cr>', "[F]ormat")

        print("[" .. client.name .. "] ")
      end)

      lsp_zero.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['tsserver'] = { 'javascript', 'typescript' },
          ['rust_analyzer'] = { 'rust' },
          ['bashls'] = { 'sh' },
          ['lua_ls'] = { 'lua' },
        }
      })

      require('mason').setup({})
      require('mason-lspconfig').setup({
        -- Replace the language servers listed here
        -- with the ones you want to install
        automatic_installation = true,
        ensure_installed = { 'lua_ls', 'tsserver', 'rust_analyzer', 'bashls' },
        handlers = {
          lsp_zero.default_setup,
          function(server)
            require('lspconfig')[server].setup({
              capabilities = require("cmp_nvim_lsp").default_capabilities()
            })
          end,
        },
      })
    end
  }
}
