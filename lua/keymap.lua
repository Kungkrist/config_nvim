-- general settings
vim.g.mapleader = " "

local Terminal = require("toggleterm.terminal").Terminal
local uv = vim.loop

local function yazi_picker()
  local tmp = vim.fn.tempname()

  -- wrapper: run yazi writing chooser file, then cat that file so it's guaranteed to exist
  local cmd = string.format([[bash -lc 'yazi --chooser-file=%q; if [ -f %q ]; then cat %q; fi']], tmp, tmp, tmp)

  -- store terminal so it's not GC'd
  local t = Terminal:new({
    cmd = cmd,
    direction = "float",
    close_on_exit = true,
    on_exit = function(_, exit_code)
      -- small delay to ensure the file is flushed
      vim.defer_fn(function()
        local f = io.open(tmp, "r")
        if f then
          local path = f:read("*l")
          f:close()
          os.remove(tmp)
          if path and #path > 0 then
            -- schedule the edit back into the main loop
            vim.schedule(function()
              vim.cmd("edit " .. vim.fn.fnameescape(path))
            end)
          end
        end
      end, 20) -- 20ms
    end,
  })

  t:toggle()
end

-- random
vim.keymap.set("n", "<leader>ge", ":Ex<CR>", { desc = "Navigation: Open File explorer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Buffer: Delete (bdelete)" })

-- telescope / search
local builtin = require('telescope.builtin')
local telescope = require('telescope')
vim.keymap.set('n', '<leader>hm', telescope.extensions.harpoon.marks, { desc = "Telescope: Harpoon Marks" })
vim.keymap.set('n', '<leader>tm', builtin.marks, { desc = "Telescope: Marks" })
vim.keymap.set('n', '<leader>tr', builtin.registers, { desc = "Telescope: registers" })
vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = "Telescope: buffers" })
vim.keymap.set('n', '<leader>tcf', builtin.current_buffer_fuzzy_find, { desc = "Telescope: current buffer fuzzy find" })
vim.keymap.set('n', '<leader>tff', builtin.find_files, { desc = "Telescope: find files" })
vim.keymap.set('n', '<leader>tgf', builtin.git_files, { desc = "Telescope: find git files" })
vim.keymap.set('n', '<leader>tkm', builtin.keymaps, { desc = "Telescope: keymaps" })
vim.keymap.set('n', '<leader>tjl', builtin.jumplist, { desc = "Telescope: jumplist" })
vim.keymap.set('n', '<leader>tlg', builtin.jumplist, { desc = "Telescope: live grep" })
vim.keymap.set('n', '<leader>tgs', function()
	builtin.grep_string({ search = vim.fn.input("grep > ") })
end, { desc = "Telescope: grep string input" })

-- yazi
vim.keymap.set("n", "<leader>y", yazi_picker, { noremap = true, silent = true })

-- undotree
vim.keymap.set('n', '<leader>hut', vim.cmd.UndotreeToggle, { desc = "UndoTree: Toggle Show/Hide" })

-- cmake-tools
local cmake_tools = require "cmake-tools"
vim.keymap.set('n', '<F7>', ':CMakeBuild<CR>', { desc = "CMake: build" })

-- dap (debugging)
local dap = require 'dap'
vim.keymap.set('n', '<f5>', dap.continue, { desc = 'Dap: Start/Continue Debugging' })
vim.keymap.set('n', '<f10>', dap.step_over, { desc = 'Dap: Step Over' })
vim.keymap.set('n', '<f11>', dap.step_into, { desc = 'Dap: Step Into' })
vim.keymap.set('n', '<f12>', dap.step_out, { desc = 'Dap: Step Out' })
vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, { desc = 'Dap: Toggle Breakpoint' })
-- vim.keymap.set('n', '<leader>di', dap.repl.open, { desc = 'Dap: Open Repl' })
vim.keymap.set('n', '<leader>drl', function()
	-- dap.run_last()
end, { desc = 'run last debug session' })

-- dapui
local dapui = require("dapui")
vim.keymap.set('n', '<leader>dtd', dapui.toggle, { desc = 'DapUI: Toggle' })

-- lsp
vim.keymap.set("n", "<leader>lih", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
	vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
end, { desc = "LSP: toggle lsp inlay hints" })

-- harpoon
local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')
vim.keymap.set('n', '<leader>ha', harpoon_mark.add_file, { desc = 'Harpoon: Add File' })
vim.keymap.set('n', '<leader>hd', harpoon_mark.rm_file, { desc = 'Harpoon: Delete File' })
vim.keymap.set('n', '<leader>hn', harpoon_ui.nav_next, { desc = 'Harpoon: Nav Next' })
vim.keymap.set('n', '<leader>hp', harpoon_ui.nav_prev, { desc = 'Harpoon: Nav Pref' })
for i = 1, 9 do
  vim.keymap.set("n", "<leader>h"..i, function()
    harpoon_ui.nav_file(i)
  end, { desc = "Harpoon jump to mark "..i })
end
