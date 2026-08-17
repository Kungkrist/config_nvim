local opts = {
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
}

require("solarized-osaka").setup(opts)

vim.cmd.colorscheme("solarized-osaka")
-- vim.cmd("hi Normal guibg=#001116 ctermbg=NONE")
