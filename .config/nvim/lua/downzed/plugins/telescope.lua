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

      local wk = require("which-key")

      wk.register({
        name = "Telescope: ",
        ["th"] = { builtin.colorscheme, "[Th]eme" },
        ["ht"] = { builtin.help_tags, "[H]elp [T]ags" },
        ["of"] = { builtin.oldfiles, "[O]ld [F]iles" },
      }, { prefix = "<leader>" })

      wk.register({
        name = "Telescope: ",
        ["<C-p>"] = { builtin.find_files, "Find Files" },
        ["<C-f>"] = { builtin.live_grep, "Live Grep" },
      })

      local function closeAllBuffers()
        local buffers = vim.api.nvim_list_bufs()
        for _, buffer in ipairs(buffers) do
          if buffer ~= vim.api.nvim_get_current_buf() then
            vim.api.nvim_buf_delete(buffer, { force = true })
          end
        end
      end

      wk.register({
        b = {
          name = "[B]uffers: ",
          f = { builtin.buffers, "Buffer list" },
          d = { ":bdelete<cr>", "Delete" },
          D = { function() closeAllBuffers() end, "Delete all but current" },
          n = { ":bnext<cr>", "Next" },
          p = { ":bprevious<cr>", "Previous" },
        }
      }, { prefix = "<leader>" })

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
