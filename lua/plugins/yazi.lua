vim.g.loaded_netrwPlugin = 1

require("yazi").setup({
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<F1>",
    },
  },
})
