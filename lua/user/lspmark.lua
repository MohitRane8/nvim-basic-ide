local M = {
  "tristone13th/lspmark.nvim",
  commit = "41d74b2873a4db5074240ba004e34c8e4b2e83f3",  -- commit date: 2025-06-03
  enabled = false,
  event = "VeryLazy",
}

M.config = function()
  require("lspmark").setup({
  })
end

return M
