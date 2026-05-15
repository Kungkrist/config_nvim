return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- transparent = true, -- Disable background color
      -- terminal_colors = true, -- Configure terminal colors
    },
    styles = {
      comments = { italic = true }, -- Style for comments
      keywords = { italic = true }, -- Style for keywords
      functions = {},               -- Style for functions
      variables = {},               -- Style for variables
      sidebars = "dark",            -- Style for sidebars
      floats = "dark",              -- Style for floating windows
    },
    config = function()
      vim.cmd.colorscheme("solarized-osaka")
      vim.cmd("hi Normal guibg=#001116 ctermbg=NONE")
      -- vim.cmd.colorscheme("catppuccin")
      -- vim.cmd [[
      --   hi Normal guibg=NONE ctermbg=NONE
      --   hi NormalNC guibg=NONE ctermbg=NONE
      --   hi NormalFloat guibg=NONE ctermbg=NONE
      --   hi SignColumn guibg=NONE ctermbg=NONE
      -- ]]
    end
  },
  -- {
  -- 	-- Color theme
  -- 	"folke/tokyonight.nvim",
  -- 	-- "catppuccin/nvim",
  -- 	priority = 1000,
  -- 	opts = {
  -- 		transparent = false,
  -- 		styles = {
  -- 			sidebars = "transparent",
  -- 			floats = "transparent",
  -- 		},
  -- 	},
  -- 	config = function()
  -- 		vim.cmd.colorscheme("tokyonight-moon")
  -- 		-- vim.cmd.colorscheme("catppuccin")
  -- 		-- vim.cmd [[
  -- 		--   hi Normal guibg=NONE ctermbg=NONE
  -- 		--   hi NormalNC guibg=NONE ctermbg=NONE
  -- 		--   hi NormalFloat guibg=NONE ctermbg=NONE
  -- 		--   hi SignColumn guibg=NONE ctermbg=NONE
  -- 		-- ]]
  -- 	end
  -- },
  -- {
  -- 	"tiagovla/tokyodark.nvim",
  -- 	opts = {
  -- 		-- custom options here
  -- 	},
  -- 	config = function(_, opts)
  -- 		require("tokyodark").setup(opts) -- calling setup is optional
  -- 		vim.cmd [[colorscheme tokyodark]]
  -- 	end,
  -- },
}
