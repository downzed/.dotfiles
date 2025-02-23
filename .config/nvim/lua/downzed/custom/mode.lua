local M = {}

M.get_is_dark_mode = function()
  if vim.fn.has('mac') == 1 then
    local handle = io.popen(
      [[osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode']]
    )

    if handle ~= nil then
      local result = handle:read('*a')
      handle:close()
      return result:match('true')
    end
  end
end

return M
