return {
  -- {
  --   -- "downzed/die-schnecke.nvim",
  --   dir = "~/Developer/lua/die-schnecke.nvim",
  --   dependencies = {
  --     "grapp-dev/nui-components.nvim",
  --     "MunifTanjim/nui.nvim",
  --   },
  -- },
  {
    dir = "~/Developer/lua/nvim-colorschemes/phosmon.nvim",
    -- "downzed/phosmon.nvim",
    config = function()
      require("phosmon").setup()
      _G.ApplyTheme("phosmon")
      vim.defer_fn(function()
        _G.ApplyTheme("rose-pine-moon")
      end, 400)
    end,
  },
}
