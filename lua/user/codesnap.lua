local M = {
  "mistricky/codesnap.nvim",
  enabled = false,
  commit = "c2924bf6c9a2c2c03318fae9b7fe0706412b9d9c",    -- commit date: Jul 30, 2024
  build = "make",
  keys = {
    -- copy to clipboard in WSL is an open issue
    -- until it is resolved, just save the snapshots in a local directory
    -- { "<leader>sc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>sc", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
  },
  opts = {
    save_path = "/mnt/c/Users/mrane/Downloads/temp",
    has_breadcrumbs = true,
    bg_theme = "bamboo",
  },
}

return M
