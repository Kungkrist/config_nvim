local ccc = require("ccc")
local zen_mode = require("zen-mode")
local lualine = require("lualine")
local todo_comments = require("todo-comments")
local render_markdown = require("render-markdown")
local grug_far = require("grug-far")
local outline = require("outline")

ccc.setup({
  highlighter = {
    auto_enable = true,
    lsp = true,
  },
})

zen_mode.setup({})
lualine.setup({})
todo_comments.setup({})
render_markdown.setup({
  html = { enabled = false },
  latex = { enabled = false },
  yaml = { enabled = false },
})
grug_far.setup({})
outline.setup({
  outline_window = {
    focus_on_open = false,
    split_command = "rightbelow vsplit",
    show_numbers = true,
    show_relative_numbers = true,
    width = 25,
  },
  outline_items = {
    show_symbol_details = true,
    show_symbol_lineno = true,
    flatten_hierarchy = true,
  },
  auto_preview = false,
  symbol_folding = {
    autofold_depth = false,
  },
  preview_window = {
    auto_preview = true,
    open_hover_on_preview = true,
  },
})
