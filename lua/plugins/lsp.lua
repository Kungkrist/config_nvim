return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "hrsh7th/nvim-cmp",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'fish',
        callback = function()
          vim.lsp.start({
            name = 'fish-lsp',
            cmd = { 'fish-lsp', 'start' },
          })
        end,
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      })

      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--query-driver=/nix/store/*clang*/bin/clang++"
        },
      })
      -- vim.lsp.config("cmake", {
      --   cmd = { "cmake-language-server" },
      --   filetypes = { "cmake" },
      --   root_markers = { "CMakeLists.txt" },
      -- })

      vim.lsp.config("actionlint", {
        cmd = { "actionlint" },
        filetypes = { "yaml" }
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("cmake")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("actionlint")
    end,
  },
}
