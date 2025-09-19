local nvim_session = require("custom/nvim_session")
local default_session = nvim_session.session_dir .. "/default.vim"

if vim.fn.filereadable(default_session) == 1 then
  local answer = vim.fn.input("Load default session? (Y/n): ")
  if answer == "" or answer:lower() == "y" then
    vim.cmd("source " .. default_session)
    print("Auto-loaded default session")
  else
    print("Skipped loading default session")
  end
end
