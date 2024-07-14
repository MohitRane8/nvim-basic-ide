local M = {
  "folke/todo-comments.nvim",
  commit = "8febc60a76feefd8203077ef78b6a262ea1a41f9",  -- release 1.1.0
  event = "BufEnter",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
    },
  },
}

M.opts = {
  highlight = {
    before = "fg",
    -- pattern = [[(KEYWORDS)\s:]],
  }
}

return M
