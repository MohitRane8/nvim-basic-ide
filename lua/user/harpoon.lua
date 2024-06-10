local M = {
  "ThePrimeagen/harpoon",
  commit = "c1aebbad9e3d13f20bedb8f2ce8b3a94e39e424a",  -- commit date: 10-20-2023
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
    },
  },
  enabled = true,
}

M.opts = {
  -- enable tabline with harpoon marks
  tabline = false,
  tabline_prefix = "   ",
  tabline_suffix = "   ",
}

return M
