return {
  {
    "uga-rosa/ccc.nvim",
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
  },
  {
    "nvim-telekasten/telekasten.nvim",
    config = function()
      local function get_notes_dir()
        local cwd = vim.loop.cwd()

        -- look for a project-specific marker
        if vim.fn.filereadable(cwd .. "/.notes") == 1 then
          return cwd
        end

        -- fallback (global notes)
        return vim.fn.expand("~/notes")
      end
      require("telekasten").setup({
        home = get_notes_dir(),
        take_over_my_home = false,
        auto_set_filetype = false,
      })
    end
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
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end
  },
  {
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
    -- Closes some gaps that exist between mason.nvim and nvim-dap
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" }
  },
  { 'tpope/vim-fugitive' }, -- Git plugin
  { "mbbill/undotree" },    -- Inspect undo history of files
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
  {
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
