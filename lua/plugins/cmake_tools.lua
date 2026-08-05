local osys = require("cmake-tools.osys")

require("cmake-tools").setup({
  cmake_command = "cmake",
  ctest_command = "ctest",
  cmake_use_preset = true,
  cmake_regenerate_on_save = false,

  cmake_generate_options = {
    "-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
  },

  cmake_build_directory = function()
    if osys.iswin32 then
      return "build\\${variant:buildType}"
    end

    return "build/${variant:buildType}"
  end,

  cmake_compile_commands_options = {
    action = "soft_link",
    target = vim.loop.cwd(),
  },

  cmake_dap_configuration = {
    name = "cpp",
    type = "codelldb",
    request = "launch",
    stopOnEntry = false,
    runInTerminal = true,
    console = "integratedTerminal",
  },
})
