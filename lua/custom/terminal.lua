local M = {}

function M.toggle_floating_terminal()
	local term_buf = nil
	local term_win = nil
	local floating_wins = {}

	-- Check if a terminal window is already open
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].buftype == 'terminal' then
			local config = vim.api.nvim_win_get_config(win)
			if config.relative ~= '' then -- check if it's a floating window
				table.insert(floating_wins, win)
			end
		end
	end

	if #floating_wins > 0 then
		-- If terminal window exists, close it
		for _, win in ipairs(floating_wins) do
			vim.api.nvim_win_close(win, true)
		end
	else
		-- If no terminal window, create a new one
		local height = math.floor(vim.o.lines * 0.8)
		local width = math.floor(vim.o.columns * 0.8)
		local row = math.floor((vim.o.lines - height) / 2)
		local col = math.floor((vim.o.columns - width) / 2)

		local buf = vim.api.nvim_create_buf(false, true)

		local win = vim.api.nvim_open_win(buf, true, {
			relative = 'editor',
			width = width,
			height = height,
			row = row,
			col = col,
			style = 'minimal',
			border = 'rounded',
		})
		vim.fn.jobstart(vim.o.shell, {
			term = true,
			pty = true,
			on_exit = function()
				vim.api.nvim_buf_delete(buf, { force = true })
			end
		})

		vim.api.nvim_set_current_win(win)
		vim.cmd('startinsert')
	end
end

return M
