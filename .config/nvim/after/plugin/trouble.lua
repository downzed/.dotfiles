require('trouble').setup()

vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
