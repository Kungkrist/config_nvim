return {
  -- telescope.nvim is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core.
  -- Telescope is centered around modularity, allowing for easy customization.
  "nvim-telescope/telescope.nvim",
  dependencies = {
    -- All the lua functions I don't want to write twice.
    "nvim-lua/plenary.nvim" },
  config = function()
    if vim.fn.executable("rg") == 0 then
      vim.notify("ripgrep not found! Telescope live_grep may not work.", vim.log.levels.WARN)
    end
  end
}
