return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		local lsp = require("lsp-zero")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			},
		})

		-- lsp.preset("recommended")
		lsp.preset({
			name = "minimal",
			set_lsp_keymaps = true,
			manage_nvim_cmp = true,
			suggest_lsp_servers = false, -- disables auto Mason install
		})

		lsp.on_attach(function(client, bufnr)
			lsp.default_keymaps({ buffer = bufnr })
		end)

		lsp.setup()
	end
}
