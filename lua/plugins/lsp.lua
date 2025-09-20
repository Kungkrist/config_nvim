return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
	},
	config = function()
		vim.lsp.config('luals', {
			cmd = { 'lua-language-server' },
			filetypes = { 'lua' },
			root_markers = { '.luarc.json', '.luarc.jsonc' },
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' }, -- Fix not found warning
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = { enable = false },
				},
			},
		})
		vim.lsp.config('cmake', {})

		vim.lsp.enable('luals')
		vim.lsp.enable('clangd')
		vim.lsp.enable('cmake')
	end
}

-- https://vonheikemen.github.io/learn-nvim/feature/lsp-setup.html#lsp-defaults
-- The following built-in keymaps will use the active language server if possible.
-- ctrl-]          -> go to definition
-- gq              -> format selected text or text object
-- K               -> display documentation of the symbol under the cursor
-- ctrl-x + ctrl-o -> in insert mode, trigger code completion

-- neovim specific:
-- grn        -> renames all references of the symbol under the cursor
-- gra        -> list code actions available in the line under the cursor
-- grr        -> lists all the references of the symbol under the cursor
-- gri        -> lists all the implementations for the symbol under the cursor
-- gO         -> lists all symbols in the current buffer
-- ctrl-s     -> in insert mode, display function signature under the cursor
-- [d         -> jump to previous diagnostic in the current buffer
-- ]d         -> jump to next diagnostic in the current buffer
-- ctrl-w + d -> show error/warning message in the line under the cursor
