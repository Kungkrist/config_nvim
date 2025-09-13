local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lsp
local on_attach = function(_, bufnr)
	local keymap = vim.keymap.set
	keymap("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, noremap = true, silent = true, desc = "LSP: Definition" })
	keymap("n", "gr", vim.lsp.buf.references, { buffer = bufnr, noremap = true, silent = true, desc = "LSP: References" })
	keymap("n", "gi", vim.lsp.buf.implementation,
		{ buffer = bufnr, noremap = true, silent = true, desc = "LSP: Implementation" })
	keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr, noremap = true, silent = true, desc = "LSP: Hover" })
	keymap("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, noremap = true, silent = true, desc = "LSP: Rename" })
	keymap("n", "<leader>ca", vim.lsp.buf.code_action,
		{ buffer = bufnr, noremap = true, silent = true, desc = "LSP: Code Action" })
	keymap("n", "<leader>f", function() vim.lsp.buf.format { async = true } end,
		{ buffer = bufnr, noremap = true, silent = true, desc = "LSP: Format" })
	keymap("n", "gl", vim.diagnostic.open_float,
		{ buffer = bufnr, noremap = true, silent = true, desc = "LSP: Diagnostic - Open Float" })
	keymap("n", "[d", vim.diagnostic.goto_prev,
		{ buffer = bufnr, noremap = true, silent = true, desc = "LSP: Diagnostic - GOTO Prev" })
	keymap("n", "]d", vim.diagnostic.goto_next,
		{ buffer = bufnr, noremap = true, silent = true, desc = "LSP: Diagnostic - GOTO Next" })
end

local servers = {
	rust_analyzer = {
		settings = {

			cargo = { allFeatures = true },
			checkOnSave = { command = "clippy" },
			enable = true,
			typeHints = true,
			chainingHints = true,
			parameterHints = true,
		}
	},
	lua_ls = {
		settings = {

			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = { library = vim.api.nvim_get_runtime_file("", true) },
				telemetry = { enable = false },
			}
		}
	},
	gdscript = {},
	clangd = {
		settings = {
			ClangdSwitchSourceHeader = {
				function()
					switch_source_header(0)
				end,
				description = 'Switch between source/header',
			},
		},
	},
	pylsp = {},
	cmake = {
		cmd = { "cmake-language-server" },
		filetypes = { "cmake" },
		root_dir = lspconfig.util.root_pattern("CMakeLists.txt", ".git"),
	},
}

for name, config in pairs(servers) do
	-- Check if the server executable exists (if cmd is defined)
	local cmd_exists = true
	if config.cmd then
		local handle = io.popen("command -v " .. config.cmd[1] .. " 2>/dev/null")
		local result = handle:read("*a")
		handle:close()
		if result == "" then
			cmd_exists = false
			vim.notify("LSP '" .. name .. "' not found in PATH, skipping...", vim.log.levels.WARN)
		end
	end

	if cmd_exists then
		lspconfig[name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = config.settings,
			cmd = config.cmd,
			commands = config.commands,
			filetypes = config.filetypes,
			root_dir = config.root_dir,
		})
	end
end
