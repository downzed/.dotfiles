local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)
keymap('n', '*', '*zz', { desc = 'Search and center screen' })

-- TIP: Disable arrow keys in normal mode   - aka "practice --force"
keymap('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
keymap('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
keymap('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
keymap('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })

keymap('n', '<leader>cp', '<cmd>let @+ = expand("%")<cr>', { desc = '[C]opy file [P]ath' })

-- Move text up and down
keymap('n', '<C-j>', ':m .+1<CR>==', opts)
keymap('n', '<C-k>', ':m .-2<CR>==', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv^', opts)
keymap('v', '>', '>gv^', opts)

-- Move text up and down
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)
keymap('v', 'p', '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap('x', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('x', 'K', ":m '<-2<CR>gv=gv", opts)
keymap('x', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('x', '<A-k>', ":m '<-2<CR>gv=gv", opts)

local function file_exists(filename)
  local f = io.open(filename, 'r')
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local function open_readme()
  local current_dir = vim.fn.getcwd()
  -- Define the path to the README.md or README file
  local readme_files = { 'README.md', 'README' }

  -- Check if any of the README files exist and open the first one found
  for _, file in ipairs(readme_files) do
    local readme_path = current_dir .. '/' .. file
    if file_exists(readme_path) then
      vim.cmd(':e ' .. readme_path)
      return
    end
  end
end
keymap('n', '<leader>o', open_readme, opts)
