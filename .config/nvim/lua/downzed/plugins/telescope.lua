return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim"
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local themes = require("telescope.themes")

      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>th", builtin.colorscheme, { desc = "Select [Th]eme" })
      vim.keymap.set('n', '<leader>ht', builtin.help_tags, { desc = "[H]elp [T]ags" })
      vim.keymap.set("n", "<leader>bf", builtin.buffers, { desc = "[B]u[f]fers" })
      vim.keymap.set("n", "<leader>of", builtin.oldfiles, { desc = "[O]ld [F]iles" })

      telescope.setup({
        extensions = {
          ["ui-select"] = {
            themes.get_dropdown({}),
          },
        },
        pickers = {
          colorscheme = {
            theme = "ivy",
            enable_preview = true,
          },
          buffers = {
            theme = "ivy",
            ignore_current_buffer = true,
          },
          live_grep = {
            theme = "ivy",
          },
          lsp_references = {
            theme = "ivy",
          },
          find_files = {
            theme = "ivy",
            ignore_patterns = { "node_modules", ".git" },
          },
          oldfiles = {
            theme = "ivy",
            only_cwd = true,
          },
        },
      })

      telescope.load_extension("ui-select")
    end,
  },
}
