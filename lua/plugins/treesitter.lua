return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require 'nvim-treesitter'.setup {
				install = {
					"yaml", "xml", "qmldir", "nix", "python", "qmljs", "javascript", "cpp", "cmake",
					"gdscript", "c", "lua", "vim", "vimdoc",
					"query", "markdown", "markdown_inline", "rust",
					"gdshader"
				},
			}
			vim.api.nvim_create_autocmd('FileType', {
				pattern = { '<filetype>' },
				callback = function() vim.treesitter.start() end,
			})
		end,
	},
}
