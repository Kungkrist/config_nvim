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
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		opts = {},
	},
	{
		'MagicDuck/grug-far.nvim',
		-- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
		-- additional lazy config to defer loading is not really needed...
		config = function()
			-- optional setup call to override plugin options
			-- alternatively you can set options with vim.g.grug_far = { ... }
			require('grug-far').setup({
				-- options, see Configuration section below
				-- there are no required options atm
			});
		end
	},
}
