return {
  {
    -- Display and generate colors
    "uga-rosa/ccc.nvim",
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    -- A blazing fast and easy to configure Neovim statusline written in Lua.
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end
  },
  {
    -- todo-comments is a lua plugin for Neovim >= 0.8.0 to highlight and search for todo comments like TODO, HACK, BUG in your code base.
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  { "nvim-lua/plenary.nvim" },
  {
    -- Fuzzy finder for files, buffers, and more
    "nvim-telescope/telescope.nvim",
    dependencies = { "plenary.nvim" }
  },
  {
    -- Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim? Either way, it's "so awesome, it should be illegal". That's why it's called Fugitive.
    'tpope/vim-fugitive' }, -- Git plugin
  {
    -- Undotree visualizes the undo history and makes it easy to browse and switch between different undo branches.
    "mbbill/undotree" }, -- Inspect undo history of files
  {
    -- Improve viewing Markdown in Neovim
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
  {
    -- Find And Replace plugin for neovim
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
  {
    -- A sidebar with a tree-like outline of symbols from your code, powered by LSP.
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    opts = {
      outline_window = {
        -- open as right sidebar
        focus_on_open = false,
        split_command = "rightbelow vsplit",
        show_numbers = true, -- real line numbers
        show_relative_numbers = true,
        width = 25,
      },
      outline_items = {
        show_symbol_details = true,
        show_symbol_lineno = true, -- show lineno in the outline
        flatten_hierachy = true,
      },
      auto_preview = false, -- optional: prevents jumping while browsing
      symbol_folding = {
        autofold_depth = false,
      },
      preview_window = {
        auto_preview = true,
        open_hover_on_preview = true,
      }
    },
  }
}
