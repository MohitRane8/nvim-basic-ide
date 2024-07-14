local M = {
  -- All in one markdown editor
  "tadmccorkle/markdown.nvim",
  commit = "dfa0d2def6dbf77e9206b16dc90cad4dd23d55d2",  -- commit date: Jun 25, 2024
  name = "markdown-edit",
  ft = { "markdown" },
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",    -- ensure 'markdown' and 'markdown_inline' are installed
  },
  enabled = false,
}

M.config = function()
  local markdown = require("markdown")
  markdown.setup{}
end

return M
