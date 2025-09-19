return {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    config = function()
        require("yazi").setup({
            opts = {
                open_for_directories = false,
                keymaps = {
                    show_help = "<f1>",
                },
            },
            init = function()
                vim.g.loaded_netrwPlugin = 1
            end,
        })
    end,
}
