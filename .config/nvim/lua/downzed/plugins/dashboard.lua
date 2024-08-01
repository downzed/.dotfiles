return {
  {
    "echasnovski/mini.starter",
    version = "*",
    config = function()
      local starter = require("mini.starter")
      starter.setup({
        items = {
          starter.sections.builtin_actions(),
          starter.sections.recent_files(10, true),
        },
        content_hooks = {
          starter.gen_hook.aligning("center", "center"),
        },
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
