return {
  {
    -- A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".
    "hrsh7th/nvim-cmp",
  },
  {
    -- nvim-cmp source for neovim's built-in language server client.
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    -- nvim-lspconfig is a collection of LSP server configurations for the Nvim LSP client.
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
          "--query-driver=/nix/store/*clang*/bin/*",

          -- "--header-insertion=never",
          -- "--query-driver=/nix/store/*clang*/bin/clang++",
          -- "--query-driver=/nix/store/*/bin/*",
          -- "--query-driver=**",
          -- "--query-driver=/nix/store/*gcc-wrapper*/bin/g++,/nix/store/*gcc*/bin/g++",
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
