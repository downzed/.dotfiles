-- local nf = require('nightfox')

-- nf.setup({
--   options = {
--     transparent = true, -- Disable setting background
--     terminal_colors = true,
--     styles = {
--       comments = "italic",
--       keywords = "underline,bold",
--       types = "bold",
--     }
--   }
-- })


function SetColorscheme(color)
  color = color or "tokyonight-night"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColorscheme()


vim.keymap.set("n", "<leader>th", require('telescope.builtin').colorscheme, { desc = "Select Colorscheme" })
