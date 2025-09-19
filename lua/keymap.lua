vim.g.mapleader = " "

-- random
vim.keymap.set("n", "<leader>ge", ":Ex<CR>", { desc = "Navigation: Open File explorer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Buffer: Delete (bdelete)" })

-- lsp
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end,
	{ desc = "LSP: Format" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP: References" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "LSP: Implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: CodeAction" })
vim.keymap.set("n", "gl", function()
	-- Get diagnostics for the current line
	local line_diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })

	-- Filter for warnings & errors only
	local filtered = {}
	for _, d in ipairs(line_diagnostics) do
		if d.severity == vim.diagnostic.severity.WARN
			or d.severity == vim.diagnostic.severity.ERROR then
			table.insert(filtered, d)
		end
	end

	-- Show in a floating window
	if #filtered > 0 then
		vim.diagnostic.open_float({ scope = "line", severity = { min = vim.diagnostic.severity.WARN } })
	end
end, { desc = "LSP: Show warnings/errors on this line" })

--- yazi
vim.keymap.set("n", "<leader>yc", ":Yazi<CR>", { desc = "Yazi: Open Current" })
vim.keymap.set("n", "<leader>yw", ":Yazi cwd<CR>", { desc = "Yazi: Open Workspace" })
vim.keymap.set("n", "<leader>yt", ":Yazi toggle<CR>", { desc = "Yazi: Resume Last" })

-- undotree
vim.keymap.set('n', '<leader>hut', vim.cmd.UndotreeToggle, { desc = "UndoTree: Toggle Show/Hide" })

-- telescope / search
local builtin = require('telescope.builtin')
local telescope = require('telescope')
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

vim.keymap.set('n', '<leader>hm', telescope.extensions.harpoon.marks, { desc = "Telescope: Harpoon Marks" })
vim.keymap.set('n', '<leader>tm', builtin.marks, { desc = "Telescope: Marks" })
vim.keymap.set('n', '<leader>tr', builtin.registers, { desc = "Telescope: registers" })
vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = "Telescope: buffers" })
vim.keymap.set('n', '<leader>tcf', builtin.current_buffer_fuzzy_find, { desc = "Telescope: current buffer fuzzy find" })
vim.keymap.set('n', '<leader>tff', builtin.find_files, { desc = "Telescope: find files" })
vim.keymap.set('n', '<leader>tgf', builtin.git_files, { desc = "Telescope: find git files" })
vim.keymap.set('n', '<leader>tkm', builtin.keymaps, { desc = "Telescope: keymaps" })
vim.keymap.set('n', '<leader>tjl', builtin.jumplist, { desc = "Telescope: jumplist" })

-- telescope / grep
vim.keymap.set('n', '<leader>tlg', builtin.jumplist, { desc = "Telescope: live grep" })
vim.keymap.set('n', '<leader>tgs', function()
	builtin.grep_string({ search = vim.fn.input("grep > ") })
end, { desc = "Telescope: grep string input" })

-- telescope / git
vim.keymap.set('n', '<leader>gs', builtin.git_stash, { desc = "Telescope: Git Stash" })
vim.keymap.set('n', '<leader>gbb', builtin.git_branches, { desc = "Telescope: Branches" })
vim.keymap.set("n", "<leader>gc", function()
	builtin.git_commits({
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local entry = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd("Gvdiffsplit " .. entry.value)
			end)
			map("n", "<CR>", function(prompt_bufnr)
				local entry = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd("Gvdiffsplit " .. entry.value)
			end)
			return true
		end,
	})
end, { desc = "Telescope: Git Commits with Diff" })

vim.keymap.set("n", "<leader>gbc", function()
	builtin.git_bcommits({
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local entry = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd("Gvdiffsplit " .. entry.value)
			end)
			map("n", "<CR>", function(prompt_bufnr)
				local entry = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd("Gvdiffsplit " .. entry.value)
			end)
			return true
		end,
	})
end, { desc = "Telescope: Buffer Git Commits with Diff" })

-- lsp
vim.keymap.set("n", "<leader>lih", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
	vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
end, { desc = "LSP: toggle lsp inlay hints" })

-- harpoon
local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')
vim.keymap.set('n', '<leader>ha', harpoon_mark.add_file, { desc = 'Harpoon: Add File' })
vim.keymap.set('n', '<leader>hd', harpoon_mark.rm_file, { desc = 'Harpoon: Delete File' })
vim.keymap.set('n', '<leader>hn', harpoon_ui.nav_next, { desc = 'Harpoon: Nav Next' })
vim.keymap.set('n', '<leader>hp', harpoon_ui.nav_prev, { desc = 'Harpoon: Nav Pref' })
for i = 1, 9 do
	vim.keymap.set("n", "<leader>h" .. i, function()
		harpoon_ui.nav_file(i)
	end, { desc = "Harpoon jump to mark " .. i })
end
