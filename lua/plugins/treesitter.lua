return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local ts = require('nvim-treesitter')
      ts.setup {
        -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
        install_dir = vim.fn.stdpath('data') .. '/site'
      }
      ts.install({ "python", "qmljs", "javascript", "cpp", "cmake",
        "gdscript", "c", "lua", "vim", "vimdoc",
        "query", "markdown", "markdown_inline", "rust",
        "gdshader", }):wait(300000) -- wait max. 5 minutes
    end,
  }
}
