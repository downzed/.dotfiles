return {
  {
    'linrongbin16/lsp-progress.nvim',
    config = function()
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local lsp_progress = require('lsp-progress')
      local lualine = require("lualine")

      lsp_progress.setup({
        client_format = function(client_name, spinner, series_messages)
          return #series_messages > 0
              and ("[" .. client_name .. "] " .. spinner .. " ")
              or nil
        end,
        format = function(client_messages)
          -- icon: nf-fa-gear \uf013
          local sign = " LSP"
          if #client_messages > 0 then
            return sign .. " " .. table.concat(client_messages, " ")
          end
          if #vim.lsp.get_active_clients() > 0 then
            return "󰞑 LSP"
          end
          return ""
        end,
      })

      lualine.setup({
        options = {
          theme = "rose-pine",
          component_separators = "",
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "mini.starter", "neotree" },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              separator = {
                left = "",
                right = "",
              },
              right_padding = 1,
            },
          },
          lualine_b = {
            "branch",
            "diff",
            "diagnostics",
          },
          lualine_c = {
            {
              "filename",
              file_status = true,
              path = 4,
            },
          },
          lualine_x = {
            lsp_progress.progress,
          },
          lualine_y = {
            "filetype",
            "progress"
          },
          lualine_z = {
            { "location", separator = { right = "", left = "" }, left_padding = 1 },
          },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
      })

      vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = "lualine_augroup",
        pattern = "LspProgressStatusUpdated",
        callback = lualine.refresh,
      })
    end,
  }
}
