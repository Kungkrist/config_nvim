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
	{
		-- Closes some gaps that exist between mason.nvim and nvim-dap
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" }
	},
	{ 'tpope/vim-fugitive' }, -- Git plugin
	{ "mbbill/undotree" }, -- Inspect undo history of files
	{ "BurntSushi/ripgrep" }, -- Used by telescope
}
