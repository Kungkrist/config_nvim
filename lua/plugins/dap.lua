return {
  "mfussenegger/nvim-dap",
  dependencies = { "williamboman/mason-nvim-dap.nvim" },
  config = function()
    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb" },
      automatic_installation = false, -- or true, depending on what you want
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })
  end,
}
