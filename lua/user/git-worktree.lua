local M = {
  "ThePrimeagen/git-worktree.nvim",
  commit = "f247308e68dab9f1133759b05d944569ad054546",  -- commit date: 09-18-2023
  enabled = true,                                       -- 'false' will not load the plugin
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
}

-- Lazy load on following keymaps
M.keys = {
  { "<leader>fg", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees(require('telescope.themes').get_dropdown({ previewer = false}))<CR>", silent = true, desc = "[git-worktree] [telescope] list worktrees" },
}

function M.config()
  require("telescope").load_extension("git_worktree")
  require("git-worktree").setup()
end

return M
