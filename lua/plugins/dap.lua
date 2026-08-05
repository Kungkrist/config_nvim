return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    dap.adapters.cppdbg = {
      type = "executable",
      command = "gdb",
      args = {
        "--interpreter=dap",
      },
    }

    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input("Executable: ")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
      },
    }

    dap.configurations.c = dap.configurations.cpp
  end,
}
