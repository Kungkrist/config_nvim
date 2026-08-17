local ts = require("nvim-treesitter")

ts.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

ts.install({
  "python",
  "qmljs",
  "javascript",
  "cpp",
  "cmake",
  "c",
  "lua",
  "vim",
  "markdown",
  "markdown_inline",
}):wait(300000)
