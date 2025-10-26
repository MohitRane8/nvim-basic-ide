local M = {
  "sindrets/diffview.nvim",
  commit = "d38c1b5266850f77f75e006bcc26213684e1e141",  -- commit date: 10-11-2023
  enabled = true,                                       -- 'false' will not load the plugin
}

-- Lazy load on following keymaps
M.keys = {
  { "<leader>hh", ":DiffviewOpen<CR>", silent = true, desc = "[diffview] open git diff" },
}

M.config = function()
  -- local actions = require("diffview.actions")

  require("diffview").setup({
    enhanced_diff_hl = true,
    show_help_hints = false,
    file_panel = {
      win_config = {
        type = "split",
        position = "right",
        width = 50,
      },
    },
  })
end

return M
