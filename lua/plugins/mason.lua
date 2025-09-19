return {
    -- Install LSP servers, debuggers, etc.
    "mason-org/mason.nvim",
	opts = {},
    config = function()
        require("mason").setup()
    end,
}
