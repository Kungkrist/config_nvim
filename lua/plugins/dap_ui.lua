local dap, dapui = require("dap"), require("dapui")
dapui.setup({
	opts = {
	mappings = {
		expand = { "<2-LeftMouse>", "<CR>" }, -- keep expand on enter
		open = "o",                       -- use `o` to open file
		remove = "d",
		edit = "e",
		repl = "r",
	}
},
})
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end


