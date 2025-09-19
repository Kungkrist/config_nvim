return {
	{
		-- Color theme
		"folke/tokyonight.nvim",
			priority = 1000,
			config = function()
				vim.cmd.colorscheme("tokyonight")
		end
	},
	{ "nvim-lua/plenary.nvim" },
	{
		-- Fuzzy finder for files, buffers, and more
		"nvim-telescope/telescope.nvim",
		dependencies = { "plenary.nvim" }
	},
	{ 'tpope/vim-fugitive' }, -- Git plugin
	{ "mbbill/undotree" }, -- Inspect undo history of files
	{ "BurntSushi/ripgrep" }, -- Used by telescope
}
