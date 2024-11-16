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
    'downzed/phosmon.nvim',
    opts = {
      ai = {
        model = 'qwen2.5',
      },
    },
  },
}
