return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function()
    vim.g.rustaceanvim = function()
      local this_os = vim.uv.os_uname().sysname;
      local install_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb"
      local codelldb_path = install_path .. "/extension/adapter/codelldb"
      local liblldb_path = install_path .. "/extension/lldb/lib/liblldb"

      if this_os:find "Windows" then
        codelldb_path = install_path .. "adapter\\codelldb.exe"
        liblldb_path = install_path .. "lldb\\bin\\liblldb.dll"
      else
        liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
      end

      local cfg = require('rustaceanvim.config')
      return {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        server = {
          on_attach = function(client, bufnr)
            if client.server_capabilities.inlayHintProvider then
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
          end,
        },
      }
    end
  end,
}
