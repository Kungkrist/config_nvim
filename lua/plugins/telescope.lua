return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim"},
    config = function()
		if vim.fn.executable("rg") == 0 then
			vim.notify("ripgrep not found! Telescope live_grep may not work.", vim.log.levels.WARN)
		end
		
        local telescope = require("telescope")
        telescope.load_extension("harpoon")
    end
}
