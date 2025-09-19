local M = {}
M.session_dir = vim.fn.getcwd() .. "/.nvim"

vim.api.nvim_create_user_command("DeleteSession", function(opts)
  local name = opts.args ~= "" and opts.args or "default"
  local path = M.session_dir .. "/" .. name .. ".vim"
  if vim.fn.filereadable(path) == 1 then
    os.remove(path)
    print("Deleted session: " .. name)
  else
    print("No session found: " .. name)
  end
end, { nargs = "?" })

vim.api.nvim_create_user_command("SaveSession", function(opts)
  local name = opts.args ~= "" and opts.args or "default"
  vim.fn.mkdir(M.session_dir, "p")  -- only runs when saving
  local path = M.session_dir .. "/" .. name .. ".vim"
  vim.cmd("mksession! " .. path)
  print("Saved session as: " .. name)
end, { nargs = "?" })

vim.api.nvim_create_user_command("LoadSession", function(opts)
  local name = opts.args ~= "" and opts.args or "default"
  local path = M.session_dir .. "/" .. name .. ".vim"
  if vim.fn.filereadable(path) == 1 then
    vim.cmd("source " .. path)
    print("Loaded session: " .. name)
  else
    print("No session found: " .. name)
  end
end, { nargs = "?" })

vim.api.nvim_create_user_command("ListSessions", function()
  local sessions = vim.fn.glob(M.session_dir .. "/*.vim", false, true)
  if #sessions == 0 then
    print("No sessions found.")
  else
    print("Available sessions:")
    for _, s in ipairs(sessions) do
      print("  " .. vim.fn.fnamemodify(s, ":t:r"))
    end
  end
end, {})

return M
