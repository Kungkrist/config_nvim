local dap = require('dap')
require('dap.ext.vscode')

local rust_cfg = vim.g.rustaceanvim()  -- call your function to get paths

-- Set the adapter from rustaceanvim
dap.adapters.codelldb = rust_cfg.dap.adapter

-- dap.adapters.codelldb = {
-- 	type = 'server',
-- 	port = "${port}",
-- 	executable = {
-- 		command = "codelldb", -- <- update this
-- 		args = { "--port", "${port}" },
--
-- 		-- optional env if needed
-- 		-- env = {
-- 		--   LLDB_LIBRARY_PATH = "/path/to/lldb/lib" -- if liblldb.so is needed
-- 		-- }
-- 	}
-- }

-- dap.configurations.rust = {
--   {
--     name = "Launch file",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       -- prompt for the executable or build default target
--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--     args = {},  -- optional command-line args
--   },
-- }
-- dap.configurations.rust = {
-- 	{
-- 		name = "Launch",
-- 		type = "codelldb",
-- 		request = "launch",
-- 		program = function()
-- 			vim.fn.system("cargo build")
-- 			-- return vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
-- 		end,
-- 		cwd = "${workspaceFolder}",
-- 		stopOnEntry = false,
-- 		args = {},
-- 	},
-- }

-- dap.adapters.cpp = {
-- 	type = "clangd",
--     request = "launch",
--     program = function()
--       vim.fn.system("ninja")
--       return vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
--     end,
--     cwd = "${workspaceFolder}",
--     stopOnEntry = false,
--     args = {},
-- }
dap.adapters.rust = {
    type = "executable",
    command = "lldb-vscode",
    name = "lldb"
}

dap.adapters.cpp = {
    type = "executable",
    command = "lldb-vscode",
    name = "lldb"
}

dap.configurations.cpp = {
    {
        name = "Build and Debug",
        type = "cpp",
        request = "launch",
        program = function()
            -- build the project first
            vim.fn.system("ninja -C build")
            -- use g:cpp_target if set, fallback to cwd name
            local target = vim.g.cpp_target or vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return vim.fn.getcwd() .. "/build/" .. target
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    }
}

dap.adapters.godot = {
	type = "server",
	host = "127.0.0.1",
	port = 6006,
}

dap.configurations.gdscript = {
	{
		type = "godot",
		request = "launch",
		name = "Launch scene",
		project = "${workspaceFolder}",
		launch_scene = true,
	},
}

vim.api.nvim_create_user_command("Breakpoint", "lua require'dap'.toggle_breakpoint()", {})
vim.api.nvim_create_user_command("Continue", "lua require'dap'.continue()", {})
vim.api.nvim_create_user_command("StepOver", "lua require'dap'.step_over()", {})
vim.api.nvim_create_user_command("StepInto", "lua require'dap'.step_into()", {})
vim.api.nvim_create_user_command("REPL", "lua require'dap'.repl.open()", {})
