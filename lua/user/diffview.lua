local M = {
  "sindrets/diffview.nvim",
  commit = "d38c1b5266850f77f75e006bcc26213684e1e141",  -- commit date: 10-11-2023
  event = "VeryLazy",
}

M.config = function()
  local actions = require("diffview.actions")

  require("diffview").setup({
    enhanced_diff_hl = true,
    show_help_hints = false,
  })
end

return M
