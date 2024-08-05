return {
  {
    "echasnovski/mini.starter",
    version = "*",
    opts = function()
      local starter = require("mini.starter")
      local opts = {
        items = {
          starter.sections.recent_files(10, true),
        }
      }
      return { starter, opts }
    end,
    config = function(_, o)
      local starter = o[1]
      local opts = o[2]

      starter.setup(opts)

      vim.api.nvim_create_autocmd('User', {
        pattern = 'LazyVimStarted',
        callback = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          opts.footer = '󱐋 ' .. stats.count .. ' plugins loaded in ' .. ms .. 'ms'
          starter.setup(opts)
          vim.cmd("lua MiniStarter.refresh()")
        end,
      })

      vim.keymap.set("n", "<leader>M", ":lua toggle_starter()<cr>", { desc = "Toggle [M]iniStarter" })

      -- function to toggle MiniStarter
      function _G.toggle_starter()
        if vim.bo.filetype == "starter" then
          vim.cmd("lua MiniStarter.close()")
        else
          vim.cmd("lua MiniStarter.open()")
        end
      end
    end,
  }
}
