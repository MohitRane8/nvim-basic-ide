local M = {
  "lukas-reineke/indent-blankline.nvim",
  commit = "8299fe7703dfff4b1752aeed271c3b95281a952d",
  event = "BufReadPre",
}

M.opts = {
  -- char = "▏",   -- U+258F
  char = "│",   -- U+2502
  -- char = "┊",   -- U+250A
  highlight = "Red",
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  show_current_context = false,
  buftype_exclude = { "terminal", "nofile", "telescope" },
  filetype_exclude = { "TelescopePrompt", "NvimTree", "DiffviewFiles", "help" },
}

return M
