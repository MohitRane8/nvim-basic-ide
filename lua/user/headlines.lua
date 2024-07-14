local M = {
  -- Alternative to markdown.nvim (present in render-markdown.lua) - All in one markdown highlighter
  "lukas-reineke/headlines.nvim",
  commit = "618ef1b2502c565c82254ef7d5b04402194d9ce3",  -- commit date: 02-29-2024
  name = "headlines",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",    -- ensure 'markdown' and 'markdown_inline' are installed
  },
  ft = { "markdown" },
  enabled = false,
}

M.config = function()
  local headlines = require("headlines")

  headlines.setup{
  }

end

return M
