local function create_tree_command(name, cmd)
  vim.api.nvim_create_user_command(name, function()
    local output_lines = vim.fn.systemlist(cmd)

    local bufname = name
    local bufnr = vim.fn.bufnr(bufname)
    if bufnr == -1 then
      bufnr = vim.api.nvim_create_buf(true, false)
      vim.api.nvim_buf_set_name(bufnr, bufname)
      vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')
      vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'hide')
      vim.api.nvim_buf_set_option(bufnr, 'swapfile', false)
    end

    vim.api.nvim_buf_set_option(bufnr, 'modifiable', true)
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, output_lines)
    vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
    vim.api.nvim_buf_set_option(bufnr, 'modified', false)

    local winid = vim.fn.bufwinid(bufnr)
    if winid == -1 then
      vim.cmd("botright vsplit")
      vim.api.nvim_set_current_buf(bufnr)
    else
      vim.api.nvim_set_current_win(winid)
    end
  end, { nargs = 0 })
end

create_tree_command("TreeDirectories", "tree -d -I 'build|third_party|.git|.cache|.nvim|.vscode'")
create_tree_command("TreeFiles", "tree -I 'build|third_party|.git|.cache|.nvim|.vscode'")
