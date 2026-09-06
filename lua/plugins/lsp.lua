-- CMP Setup
require("blink.cmp").setup({
  keymap = {
    preset = "none",

    ["<CR>"] = {
      "accept",
      "fallback",
    },

    ["<Tab>"] = {
      "select_next",
      "snippet_forward",
      "fallback",
    },

    ["<S-Tab>"] = {
      "select_prev",
      "snippet_backward",
      "fallback",
    },

    ["<C-h>"] = {
      "hide",
      "fallback",
    },

    ["<C-j>"] = {
      "select_next",
      "fallback",
    },

    ["<C-k>"] = {
      "select_prev",
      "fallback",
    },

    ["<C-l>"] = {
      "accept",
      "fallback",
    },
  },

  completion = {
    documentation = {
      auto_show = true,
    },
  },
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
capabilities = vim.tbl_deep_extend("force", capabilities, {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
})

-- LSP Setup
vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.lsp.config("fish-lsp", {
  cmd = { "fish-lsp", "start" },
  filetypes = { "fish" },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
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
  },
})

vim.lsp.config("actionlint", {
  cmd = { "actionlint" },
  filetypes = { "yaml" },
})

vim.lsp.config("harper", {
  cmd = { "harper-ls", "--stdio" },
  filetypes = { "markdown" },
})

vim.lsp.enable({
  "lua_ls",
  "clangd",
  "cmake",
  "jsonls",
  "actionlint",
  "fish-lsp",
  "harper",
})
