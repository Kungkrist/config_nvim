local telescope = require("telescope")

telescope.setup()

if vim.fn.executable("rg") == 0 then
  vim.notify(
    "ripgrep not found! Telescope live_grep may not work.",
    vim.log.levels.WARN
  )
end
