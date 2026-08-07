-- Make Panel into an interactable buffer when focused (e.g., when doing :G status)
require('vim._core.ui2').enable({})

vim.api.nvim_create_user_command("SaveAll", function()
  vim.cmd("wall ++p")
end, {})
