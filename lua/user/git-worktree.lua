local M = {
  "ThePrimeagen/git-worktree.nvim",
  commit = "f247308e68dab9f1133759b05d944569ad054546",  -- commit date: 09-18-2023
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      commit = "40c31fdde93bcd85aeb3447bb3e2a3208395a868",
    },
  },
  enabled = true,
}

function M.config()
  require("git-worktree").setup({
  })
end

return M
