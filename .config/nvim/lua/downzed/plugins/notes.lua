return {
  {
    "zk-org/zk-nvim",
    config = function()
      local zk = require("zk")
      local wk = require("which-key")

      zk.setup({
        picker = "select",
        lsp = {
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
          },
        },
      })

      wk.register({
        z = {
          name = "[Z]ettelkasten",
          n = { "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>", "New Note" },
          o = { "<cmd>ZkNotes { sort = { 'modified' } }<cr>", "Open Notes" },
          t = { "<cmd>ZkTags<cr>", "Open Tags" },
          f = { "<cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<cr>", "Search Notes" },
        }
      }, { prefix = "<leader>" })

      wk.register({
        z = {
          name = "[Z]ettelkasten",
          f = { ":'<,'>ZkMatch<CR>", "Search Notes" },
        }
      }, { prefix = "<leader>", mode = "v", noremap = true, silent = false })
    end
  }
}
