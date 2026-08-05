local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item({
      behavior = cmp.SelectBehavior.Select,
    }),
    ["<C-n>"] = cmp.mapping.select_next_item({
      behavior = cmp.SelectBehavior.Select,
    }),
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
    }),
    ["<C-Space>"] = cmp.mapping.complete(),
  },

  sources = {
    { name = "nvim_lsp" },
  },
})

vim.lsp.config("*", {
  capabilities = cmp_lsp.default_capabilities(),
})
