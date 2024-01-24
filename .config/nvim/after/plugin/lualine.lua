local ll = require('lualine');

local seps = {
  left = "",
  right = "",
}

ll.setup({
  options = {
    component_separators = seps,
    section_separators = seps,
    icons_enabled = true,
    theme = 'auto',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_c = {
      {
        'filename',
        path = 3
      },
    },
    lualine_x = {
      "require('lsp-progress').progress()",
    }
  }
})

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressUpdate",
  callback = function()
    ll.refresh()
  end
})
