return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          position = "left",
        },
        event_handlers = {
          {
            event = "file_opened",
            handler = function()
              require("neo-tree.command").execute({ action = "close" })
            end,
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
            update_root = true,
          },
        },
      })

      vim.keymap.set("n", "<leader>tn", "<cmd>Neotree toggle<CR>", { desc = "[T]oggle [N]eoTree" })
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local oil = require("oil")
      oil.setup()
      vim.keymap.set("n", "<leader>to", oil.open, { desc = "[T]oggle [O]il" })
    end
  }
}
