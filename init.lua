require("plugins")
require("plugins/dap_ui")
require("plugins/cmake_tools")
require("plugins/lsp")
require("plugins/dap")
require("plugins/harpoon")
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

-- paths to check for project.godot file
local paths_to_check = {'/', '/../'}
local is_godot_project = false
local godot_project_path = ''
local cwd = vim.fn.getcwd()

-- iterate over paths and check
for key, value in pairs(paths_to_check) do
    if vim.uv.fs_stat(cwd .. value .. 'project.godot') then
        is_godot_project = true
        godot_project_path = cwd .. value
        break
    end
end

-- check if server is already running in godot project path
local is_server_running = vim.uv.fs_stat(godot_project_path .. '/server.pipe')
-- start server, if not already running
if is_godot_project and not is_server_running then
    vim.fn.serverstart(godot_project_path .. '/server.pipe')
end
