-- general settings
vim.g.mapleader = " "

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

local function toggle_src_header()
	local current = vim.api.nvim_buf_get_name(0)
	local basename = vim.fn.fnamemodify(current, ":t:r") -- file name without extension
	local ext = vim.fn.fnamemodify(current, ":e")

	local target

	if ext == "cpp" then
		-- try same dir first
		target = vim.fn.fnamemodify(current, ":h") .. "/" .. basename .. ".hpp"
		if vim.fn.filereadable(target) == 0 then
			-- fallback: replace src/ with include/
			target = current:gsub("/src/.*$", "/include/" .. basename .. ".hpp")
		end
	elseif ext == "hpp" or ext == "h" then
		target = current:gsub("/include/.*$", "/src/" .. basename .. ".cpp")
		if vim.fn.filereadable(target) == 0 then
			-- fallback: same dir
			target = vim.fn.fnamemodify(current, ":h") .. "/" .. basename .. ".cpp"
		end
	end

	if target then
		vim.cmd("edit " .. target)
	else
		print("No matching source/header for " .. current)
	end
end

vim.keymap.set("n", "<leader>hh", toggle_src_header, { desc = "Switch header/source" })

-- random
vim.keymap.set("n", "<leader>ge", ":Ex<CR>", { desc = "Navigation: Open File explorer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Buffer: Delete (bdelete)" })

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

-- toggleterm
local Terminal = require("toggleterm.terminal").Terminal
local terminalTop = Terminal:new({ cmd = "top", hidden = true })

function _TOP_TERMINAL_TOGGLE()
	terminalTop:toggle()
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.keymap.set("n", "<C-§>", ":ToggleTerm<CR>", { desc = "ToggleTerm: Toggle Terminal" })
vim.keymap.set("n", "<C-t>t", ":lua _TOP_TERMINAL_TOGGLE()<CR>", { desc = "ToggleTerm: Toggle Top Terminal" })

-- yazi
vim.keymap.set("n", "<leader>yc", ":Yazi<CR>", { desc = "Yazi: Open Current" })
vim.keymap.set("n", "<leader>yw", ":Yazi cwd<CR>", { desc = "Yazi: Open Workspace" })
vim.keymap.set("n", "<leader>yt", ":Yazi toggle<CR>", { desc = "Yazi: Resume Last" })
--
-- undotree
vim.keymap.set('n', '<leader>hut', vim.cmd.UndotreeToggle, { desc = "UndoTree: Toggle Show/Hide" })

-- cmake-tools
local cmake_tools = require "cmake-tools"
vim.keymap.set('n', '<F7>', ':CMakeBuild<CR>', { desc = "CMake: Build" })
vim.keymap.set('n', '<F6>', ':CMakeConfigurePreset<CR>', { desc = "CMake: Configure" })

-- dap (debugging)
local dap = require 'dap'
vim.keymap.set('n', '<f5>', dap.continue, { desc = 'Dap: Start/Continue Debugging' })
vim.keymap.set('n', '<f10>', dap.step_over, { desc = 'Dap: Step Over' })
vim.keymap.set('n', '<f11>', dap.step_into, { desc = 'Dap: Step Into' })
vim.keymap.set('n', '<f12>', dap.step_out, { desc = 'Dap: Step Out' })
vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, { desc = 'Dap: Toggle Breakpoint' })
-- vim.keymap.set('n', '<leader>di', dap.repl.open, { desc = 'Dap: Open Repl' })
vim.keymap.set('n', '<leader>drl', function()
	-- dap.run_last()
end, { desc = 'run last debug session' })

-- dapui
local dapui = require("dapui")
vim.keymap.set('n', '<leader>dtd', dapui.toggle, { desc = 'DapUI: Toggle' })

-- lsp
vim.keymap.set("n", "<leader>lih", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
	vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
end, { desc = "LSP: toggle lsp inlay hints" })

-- harpoon
local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')
vim.keymap.set("n", "<leader>hh", toggle_src_header, { desc = "Harpoon: Toggle header/source" })
vim.keymap.set('n', '<leader>ha', harpoon_mark.add_file, { desc = 'Harpoon: Add File' })
vim.keymap.set('n', '<leader>hd', harpoon_mark.rm_file, { desc = 'Harpoon: Delete File' })
vim.keymap.set('n', '<leader>hn', harpoon_ui.nav_next, { desc = 'Harpoon: Nav Next' })
vim.keymap.set('n', '<leader>hp', harpoon_ui.nav_prev, { desc = 'Harpoon: Nav Pref' })
for i = 1, 9 do
	vim.keymap.set("n", "<leader>h" .. i, function()
		harpoon_ui.nav_file(i)
	end, { desc = "Harpoon jump to mark " .. i })
end
