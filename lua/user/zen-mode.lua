local M = {
  "folke/zen-mode.nvim",
  commit = "50e2e2a36cc97847d9ab3b1a3555ba2ef6839b50",  -- commit date: 10-20-2023
  enabled = true,                                       -- 'false' will not load the plugin
}

-- Lazy load on following keymaps
M.keys = {
  { "<leader>z", ":ZenMode<CR>", silent = true, desc = "[zen-mode] toggle zen mode" },
}

M.opts = {
  window = {
    backdrop = 1,
    options = {
      number = false,
    },
  },
  plugins = {
    options = { laststatus = 0 },
    tmux = { enabled = true },
  },
}

return M
