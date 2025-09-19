local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local cmp = require('cmp')

-- cmp.setup({
-- 	mapping = {
-- 		-- confirm selection with <C-Space> instead of <C-Y>
-- 		['<C-Space>'] = cmp.mapping.confirm({ select = true }),
-- 		-- don't include <C-Y> at all
-- 	},
-- })

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
	-- rust_analyzer = {
	-- 	settings = {
	-- 		diagnostics = { enable = false },
	-- 		assist = { importMergeBehavior = "last", importPrefix = "by_self" },
	-- 		procMacro = { enable = true },
	-- 		cargo = { allFeatures = true },
	-- 		checkOnSave = { command = "clippy" },
	-- 		enable = true,
	-- 		typeHints = true,
	-- 		chainingHints = true,
	-- 		parameterHints = true,
	-- 	}
	-- },
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

vim.g.rustaceanvim = function()
local this_os = vim.uv.os_uname().sysname;

local install_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb"
local codelldb_path = install_path .. "/extension/adapter/codelldb"
local liblldb_path = install_path .. "/extension/lldb/lib/liblldb"
  -- The path is different on Windows
  if this_os:find "Windows" then
    codelldb_path = extension_path .. "adapter\\codelldb.exe"
    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
  else
    -- The liblldb extension is .so for Linux and .dylib for MacOS
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
  end

  local cfg = require('rustaceanvim.config')
  return {
    dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  server = {
    on_attach = on_attach
	},
  }
end
