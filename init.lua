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
    version = '5506c2f59dc9ab2ed6c233585412b24d31d51521', -- 1.6.70
  },
  {
    -- A blazing fast and easy to configure Neovim statusline written in Lua. 8.1k stars
    src = 'https://github.com/nvim-lualine/lualine.nvim',
    version = '221ce6b2d999187044529f49da6554a92f740a96',
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
    version = '229b79051b380377664edc4cbd534930154921a1', -- v2.10.0
  },
  {
    -- Advanced syntax highlighting and parsing using Tree-sitter. 14.3k stars
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = '4916d6592ede8c07973490d9322f187e07dfefac', -- committed on Apr 3
  },
  {
    -- Provides Nerd Font 1 icons (glyphs) for use by Neovim plugins. 2.7k stars
    src = 'https://github.com/nvim-tree/nvim-web-devicons',
    version = '2ae6958df7ced50baac5035cec0c15799eedfbf7',
  },
  {
    -- A sidebar with a tree-like outline of symbols from your code, powered by LSP. 1.0k stars
    src = 'https://github.com/hedyhli/outline.nvim',
    version = '2a132953b944561d45b52e4541ebfff71934a742', -- May 29
  },
  {
    -- A lib of common lua functions. Usually acts an dependency towards other plugins. 3.5k stars
    -- INFO: This repository is no longer actively maintained and will be officially archived soon.
    -- Critical bugs may still be addressed until 2026-06-30.
    src = 'https://github.com/nvim-lua/plenary.nvim',
    version = '74b06c6c75e4eeb3108ec01852001636d85a932b', -- Apr 10
  },
  {
    -- Improve viewing Markdown in Neovim. 4.9k stars
    src = 'https://github.com/meanderingprogrammer/render-markdown.nvim',
    version = 'e3c18ddd27a853f85a6f513a864cf4f2982b9f26', -- v8.12.0
  },
  {
    -- telescope.nvim is a highly extendable fuzzy finder over lists. 19.7k stars
    src = 'https://github.com/nvim-telescope/telescope.nvim',
    version = '427b576c16792edad01a92b89721d923c19ad60f', -- Jun 23
  },
  {
    -- Undotree visualizes the undo history and makes it easy to browse and switch between different undo branches. 4.5k stars
    src = 'https://github.com/mbbill/undotree',
    version = '6fa6b57cda8459e1e4b2ca34df702f55242f4e4d', -- Mar 8
  },
  {
    -- Fugitive is the premier Vim plugin for Git. 21.8k stars
    src = 'https://github.com/tpope/vim-fugitive',
    version = '3b753cf8c6a4dcde6edee8827d464ba9b8c4a6f0', -- Mar 7
  },
  {
    -- WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type. 7.2k stars
    src = 'https://github.com/folke/which-key.nvim',
    version = '3aab2147e74890957785941f0c1ad87d0a44c15a', -- Oct 28, 2025
  },
  {
    -- A Neovim Plugin for yazi. 1.8k stars
    src = 'https://github.com/mikavilpas/yazi.nvim',
    version = '8d6c25cb4e7c5702d6cd5a263cb36129fa78aa4c', -- release 13.9.0
  }
})

require("options")
require("commands")
require("plugins")
require("keymap")
require("custom")
