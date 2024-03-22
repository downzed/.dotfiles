return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
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
      filesystem = {
        follow_current_file = {
          enabled = true,
          update_root = true,
        },
      },
    })
    vim.keymap.set("n", "<C-n>", ":Neotree reveal position=left toggle<CR>")
  end,
}
