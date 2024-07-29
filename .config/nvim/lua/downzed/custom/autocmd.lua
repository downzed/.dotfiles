local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local function sync_notes()
  local dir = "~/Developer/notes"
  local commit_msg = "Sync: " .. os.date("%Y-%m-%d %H:%M:%S")
  local notify_opts = { title = "Downzed" }

  vim.fn.chdir(dir)

  local current_dir = vim.fn.getcwd()

  if current_dir ~= dir then
    vim.notify("You can only sync notes from the notes directory!", vim.log.levels.ERROR, notify_opts)
    return
  end

  vim.fn.system("git add .")
  vim.fn.system("git commit -m " .. commit_msg)
  vim.fn.system("git push")

  vim.notify("Notes synced!", vim.log.levels.INFO, notify_opts)

  vim.fn.chdir("~")
end

local group = vim.api.nvim_create_augroup("SyncNotesGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "norg",
  group = group,
  callback = function()
    local root_dir = vim.fn.expand("~/Developer/notes")
    local current_dir = vim.fn.getcwd()

    if current_dir:find(root_dir) then
      vim.api.nvim_buf_create_user_command(0, 'SyncNotes', sync_notes, {})
    end
  end
})
