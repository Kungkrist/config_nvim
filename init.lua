-- INFO:  :lua vim.pack.update() - to update everything
--        :lua vim.pack.update({ "nvim-lspconfig" }) - to update a specific pluigin

vim.pack.add({
  {
    -- Fast nagivation inside buffers. 4.2k stars
    src = 'https://github.com/folke/flash.nvim.git',
    version = 'b6346946d10d07998efee029fb0f7a593806d0cd', -- Jul 10
  },
  {
    -- One of the Solarized-inspired dark theme for Neovim written in Lua. 1.0k stars
    src = 'https://github.com/craftzdog/solarized-osaka.nvim',
    version = 'f675d9a5c58f3b0d6158d665a623f81a62e7bdaf',
  },
  {
    -- Create Color Code in neovim. 980 stars
    -- WARN: Haven't been updated for over a year (not maintained anymore?)
    src = 'https://github.com/uga-rosa/ccc.nvim',
    version = '9d1a256e006decc574789dfc7d628ca11644d4c2',
  },
  {
    -- CMake Tools for Neovim which is written in pure lua. 556 stars
    src = 'https://github.com/Civitasv/cmake-tools.nvim',
    version = '22859d754b5de738cfe9945e0910729f63deefd0',
  },
  {
    -- blink.cmp is a completion plugin with support for LSPs, cmdline, signature help, and snippets. 6.5k stars
    src = 'https://github.com/saghen/blink.cmp',
    version = '78336bc89ee5365633bcf754d93df01678b5c08f', -- v1.10.2
  },
  {
    -- Find And Replace plugin for neovim. 2.0k stars
    src = 'https://github.com/MagicDuck/grug-far.nvim',
    version = '6e05398cf6cad05b3fb46569db96b1ccfcbbd402',
  },
  {
    -- A blazing fast and easy to configure Neovim statusline written in Lua. 8.1k stars
    src = 'https://github.com/nvim-lualine/lualine.nvim',
    version = '221ce6b2d999187044529f49da6554a92f740a96',
  },
  {
    -- A completion engine plugin for neovim written in Lua. 9.5k stars
    src = 'https://github.com/hrsh7th/nvim-cmp',
    version = '2ffe79f1f021def8dd1fcd81deb16f1bb0d989f3',
  },
  {
    -- nvim-dap is a Debug Adapter Protocol client implementation for Neovim. 7.2k stars
    src = 'https://github.com/mfussenegger/nvim-dap',
    version = '9e848e09a697ee95302a3ef2dd43fd6eb709e570',
  },
  {
    -- A library for asynchronous IO in Neovim, inspired by the asyncio library in Python. 431 stars
    -- INFO: Dependency for nvim-dap-ui
    src = 'https://github.com/nvim-neotest/nvim-nio',
    version = 'edcc181a875301dd21840189aa2f2f9ad69fc172',
  },
  {
    -- A UI for nvim-dap which provides a good out of the box configuration. 3.4k stars
    src = 'https://github.com/rcarriga/nvim-dap-ui',
    version = 'cc9dd33aade7f20bae414d0cba163bc60d4d4b43',
  },
  {
    -- An asynchronous linter plugin for Neovim (>= 0.9.5) complementary to the built-in Language Server Protocol support. 2.8k stars
    src = 'https://github.com/mfussenegger/nvim-lint',
    version = 'a219b2c9e5b4765e5c845aba119dad55806fcaf1',
  },
  {
    -- nvim-lspconfig is a collection of LSP server configurations for the Nvim LSP client. 13.8k stars
    src = 'https://github.com/neovim/nvim-lspconfig',
    version = '43ed3797b266e1ee8d222e491379ad471c9d3146',
  },
  {
    -- Advanced syntax highlighting and parsing using Tree-sitter. 14.3k stars
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = '7b6cc8949f9999c5ed91436cbe24aa5f99c42025',
  },
  {
    -- Provides Nerd Font 1 icons (glyphs) for use by Neovim plugins. 2.7k stars
    src = 'https://github.com/nvim-tree/nvim-web-devicons',
    version = '2ae6958df7ced50baac5035cec0c15799eedfbf7',
  },
  {
    -- A sidebar with a tree-like outline of symbols from your code, powered by LSP. 1.0k stars
    src = 'https://github.com/hedyhli/outline.nvim',
    version = '2a132953b944561d45b52e4541ebfff71934a742',
  },
  {
    -- A lib of common lua functions. Usually acts an dependency towards other plugins. 3.5k stars
    -- INFO: This repository is no longer actively maintained and will be officially archived soon.
    -- Critical bugs may still be addressed until 2026-06-30.
    src = 'https://github.com/nvim-lua/plenary.nvim',
    version = '74b06c6c75e4eeb3108ec01852001636d85a932b',
  },
  {
    -- Improve viewing Markdown in Neovim. 4.9k stars
    src = 'https://github.com/meanderingprogrammer/render-markdown.nvim',
    version = 'f422cb5c6855f150e2ddcfaf44e7157b98b34f6a',
  },
  {
    -- telescope.nvim is a highly extendable fuzzy finder over lists. 19.7k stars
    src = 'https://github.com/nvim-telescope/telescope.nvim',
    version = '427b576c16792edad01a92b89721d923c19ad60f',
  },
  {
    -- todo-comments is a lua plugin for Neovim >= 0.8.0 to highlight and search for todo comments like TODO, HACK, BUG in your code base. 4.2k stars
    src = 'https://github.com/folke/todo-comments.nvim',
    version = '31e3c38ce9b29781e4422fc0322eb0a21f4e8668',
  },
  {
    -- Undotree visualizes the undo history and makes it easy to browse and switch between different undo branches. 4.5k stars
    src = 'https://github.com/mbbill/undotree',
    version = '6fa6b57cda8459e1e4b2ca34df702f55242f4e4d',
  },
  {
    -- Fugitive is the premier Vim plugin for Git. 21.8k stars
    src = 'https://github.com/tpope/vim-fugitive',
    version = '3b753cf8c6a4dcde6edee8827d464ba9b8c4a6f0',
  },
  {
    -- WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type. 7.2k stars
    src = 'https://github.com/folke/which-key.nvim',
    version = '3aab2147e74890957785941f0c1ad87d0a44c15a',
  },
  {
    -- A Neovim Plugin for yazi. 1.8k stars
    src = 'https://github.com/mikavilpas/yazi.nvim',
    version = '8d6c25cb4e7c5702d6cd5a263cb36129fa78aa4c', -- release 13.9.0
  },
  {
    -- Distraction-free coding for Neovim >= 0.5. 2.2k stars
    src = 'https://github.com/folke/zen-mode.nvim',
    version = '8564ce6d29ec7554eb9df578efa882d33b3c23a7',
  },
})

require("options")
require("commands")
require("plugins")
require("keymap")
require("custom")
