require("plugins")
require("plugins/yazi")
require("plugins/lsp")
require("plugins/dap")
require("plugins/dap_ui")
require("plugins/cmake_tools")
require("plugins/harpoon")
require("plugins/toggle_term")
require("options")
require("keymap")

local commands = require("commands")
local default_session = commands.session_dir .. "/default.vim"
-- if vim.fn.filereadable(default_session) == 1 then
-- 	vim.cmd("source " .. default_session)
-- 	print("Auto-loaded default session")
-- end
if vim.fn.filereadable(default_session) == 1 then
  local answer = vim.fn.input("Load default session? (Y/n): ")
  if answer == "" or answer:lower() == "y" then
    vim.cmd("source " .. default_session)
    print("Auto-loaded default session")
  else
    print("Skipped loading default session")
  end
end
