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
    -- dir = "~/Developer/lua/nvim-colorschemes/phosmon.nvim",
    "downzed/phosmon.nvim",
    opts = {
    },
    config = function(_, opts)
      require("phosmon").setup(opts)
      _G.ApplyTheme("rose-pine-main")
    end
  },
}
