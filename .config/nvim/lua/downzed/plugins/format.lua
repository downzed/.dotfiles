return {
  {
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = {
          -- c = true,
          -- cpp = true,
          scss = true,
          css = true,
        }

        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        rust = { 'rustfmt' },
        javascript = { { 'eslint_d', 'eslint' } },
        typescript = { 'tsserver' },
        c = { 'clang_format' },
        cpp = { 'clang_format' },
      },
    },
  },
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        lua = { 'luacheck' },
      }
      vim.api.nvim_create_autocmd('BufWritePost', {
        callback = function()
          -- check if filetype is lua
          if vim.bo.filetype == 'lua' then
            require('lint').try_lint('luacheck')
          end
        end,
      })
      -- You can set up an autocmd to run linting automatically
      -- vim.cmd([[
      --   augroup Linting
      --     autocmd!
      --     autocmd BufWritePost * lua require('lint').try_lint()
      --   augroup END
      -- ]])
    end
  }
}
