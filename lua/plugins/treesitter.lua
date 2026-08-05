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
  "gdscript",
  "c",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
  "rust",
  "gdshader",
}):wait(300000)